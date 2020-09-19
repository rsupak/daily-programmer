(function () {
  var catalog_id = $sp.getParameter("catalog_id") ? $sp.getParameter("catalog_id") + "" : "-1";
  var catalogSelectorArr = [{
    value: "-1",
    displayValue: gs.getMessage("All")
  }];
  data.selectedCatalogIndex = catalog_id == -1 ? 0 : -1;
  var catalogIDs = $sp.getCatalogs().value + "";
  var catalogs = catalogIDs.split(",");
  var isCatalogAccessibleViaPortal = catalog_id == -1 ? true : false;
  catalogs.forEach(function (catalogSysId) {
    if (catalog_id == catalogSysId) {
      isCatalogAccessibleViaPortal = true;
    }
  });
  var counter = 1;
  catalogs.forEach(function (catalogSysId) {
    var catalog = new sn_sc.Catalog(catalogSysId);
    var catalogObj = {
      value: catalogSysId,
      displayValue: catalog.getTitle()
    };
    if (catalog.canView()) {
      if (catalog_id === catalogSysId) {
        data.selectedCatalogIndex = counter;
      }
      catalogSelectorArr.push(catalogObj);
      counter++;
    }
  });
  data.catalogSelectorArr = catalogSelectorArr;
  data.catalog_id = catalog_id ? catalog_id : "-1";
  data.showMoreMsg = gs.getMessage("Show More");
  data.pleaseWait = gs.getMessage("Please wait... fetching categories");
  var categoryId = JSUtil.nil($sp.getParameter('sys_id')) ? "" : $sp.getParameter('sys_id') + "";
  data.categoryId = categoryId;
  var catalogIDs = (data.catalog_id && data.catalog_id !== "-1") ? data.catalog_id : $sp.getCatalogs().value + "";
  var viewType = '';
  var checkCanView = false;
  var countViewableItems = false;
  var nestedLayout = (options.category_layout !== "Flat");
  var dynamicCategory = false;
  var catalogArr = catalogIDs.split(",");
  var catalogs = [];
  catalogArr.forEach(function (catalogSysId) {
    var catalog = new sn_sc.Catalog(catalogSysId);
    if (catalog.canView()) {
      catalogs.push(catalogSysId);
    }
  });
  data.categoryId = categoryId;
  var msg = data.messages = {};
  msg.expanded = gs.getMessage("Expanded");
  msg.collapsed = gs.getMessage("Collapsed");
  msg.catalogTitle = options.catalog_title ? gs.getMessage(options.catalog_title) : gs.getMessage('Catalogs');
  data.largeDataSet = gs.getProperty("glide.sc.largeSet.optimization.enable", "false");
  if (data.largeDataSet == 'true')
    nestedLayout = false;
  if (options.page) {
    var page = new GlideRecord('sp_page');
    if (page.get(options.page))
      data.page = page.id + '';
  }
  checkCanView = (options.check_can_view == 'true');
  countViewableItems = (options.omit_badges == 'false');
  if (!isCatalogAccessibleViaPortal) {
    return;
  }
  data.categoriesList = [];
  var categoriesInPage = options.number_of_categories_to_load || 15;
  data.limit = categoriesInPage;
  if (input && input.new_limit)
    data.limit = input.new_limit;
  if (input && input.categoriesList)
    data.categoriesList = input.categoriesList.slice(); //Copy the input array
  if (input && input.startWindow) {
    data.endWindow = input.endWindow;
  } else {
    data.startWindow = 0;
    data.endWindow = 0;
  }
  while (data.categoriesList.length < data.limit + 1) {
    data.startWindow = data.endWindow;
    data.endWindow = data.endWindow + categoriesInPage;
    var catGr = queryCategory(catalogs, nestedLayout, dynamicCategory, data.startWindow, data.endWindow);
    if (!catGr.hasNext())
      break;
    fetchCategories(catGr, data.categoriesList);
  }
  if (data.categoriesList.length > data.limit)
    data.showMore = true;
  else
    data.showMore = false;
  data.more_msg = gs.getMessage("Showing {0} categories", data.limit);

  function fetchCategories(categoriesGr, categories) {
    while (categoriesGr.next()) {
      var categoryJS = new sn_sc.CatCategory(categoriesGr.getUniqueValue() + '');
      if (!categoryJS.canView())
        continue;
      var categoryDetails = getCategoryDetails(categoryJS, 0);
      categoryDetails.sys_id = categoriesGr.getUniqueValue();
      categories.push(categoryDetails);
    }
  }

  function queryCategory(catalogs, nestedLayout, dynamicCategory, startWindow, endWindow) {
    var categoriesGr = new GlideRecord('sc_category');
    categoriesGr.addQuery("sc_catalog", catalogs);
    if (!dynamicCategory)
      categoriesGr.addQuery("sys_class_name", "sc_category");
    categoriesGr.addActiveQuery();
    categoriesGr.orderBy('order');
    categoriesGr.orderBy('title');
    if (nestedLayout)
      categoriesGr.addNullQuery("parent");
    categoriesGr.chooseWindow(startWindow, endWindow);
    categoriesGr.query();
    return categoriesGr;
  }

  function getCategoryDetails(categoryJS, level) {
    var categoryDetails = {};
    var showChildren = true;
    if (!categoryJS) {
      return categoryDetails;
    }
    categoryDetails.title = categoryJS.getTitle();
    categoryDetails.level = level;
    categoryDetails.description = categoryJS.getDescription();
    categoryDetails.full_description = categoryJS.getFullDescription();
    categoryDetails.icon = categoryJS.getIconSRC();
    categoryDetails.header_icon = categoryJS.getHeaderIconSRC();
    categoryDetails.homepage_image = categoryJS.getHomepageImageSRC();
    categoryDetails.sys_id = categoryJS.getID();
    categoryDetails.showChildren = (categoryDetails.sys_id === categoryId || categoryDetails.sys_id === categoryId);
    categoryDetails.catalog = {
      "sys_id": categoryJS.getCatalog(),
      "title": new sn_sc.Catalog(categoryJS.getCatalog()).getTitle()
    }
    if (catalog_id == -1 && catalogSelectorArr.length > 2)
      categoryDetails.catalog_tooltip = gs.getMessage("[{0}]", categoryDetails.catalog.title);
    else
      categoryDetails.catalog_tooltip = '';
    if (data.largeDataSet != 'true' && countViewableItems) {
      if (checkCanView) {
        categoryDetails.count = categoryDetails.totalCount = categoryJS.getViewableItemsCount(true);
      } else {
        categoryDetails.count = categoryDetails.totalCount = categoryJS.getItemsCount(true);
      }
    } else {
      categoryDetails.count = categoryDetails.totalCount = 1;
    }
    var subCategoryCounts = 0;
    if (nestedLayout) {
      var subcategories = categoryJS.getViewableSubCategories();
      if (subcategories.length == 0) {
        categoryDetails.subcategories = [];
      } else {
        categoryDetails.subcategories = [];
        subcategories.forEach(function (subCategory) {
          var subCategoryJS = new sn_sc.CatCategory(subCategory.sys_id + '');
          var category = getCategoryDetails(subCategoryJS, level + 1);
          categoryDetails.totalCount = categoryDetails.totalCount + category.totalCount;
          categoryDetails.subcategories.push(category);
          categoryDetails.showChildren = categoryDetails.showChildren || category.showChildren;
        });
      }
    } else {
      categoryDetails.totalCount = categoryDetails.count;
    }
    return categoryDetails;
  }
})();
