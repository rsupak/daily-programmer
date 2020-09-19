"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Comparator = function () {
  function Comparator(compareFunction) {
    _classCallCheck(this, Comparator);

    this.compare = compareFunction || Comparator.defaultCompareFunction;
  }

  _createClass(Comparator, [{
    key: "equal",
    value: function equal(a, b) {
      return this.compare(a, b) === 0;
    }
  }, {
    key: "lessThan",
    value: function lessThan(a, b) {
      return this.compare(a, b) < 0;
    }
  }, {
    key: "greaterThan",
    value: function greaterThan(a, b) {
      return this.compare(a, b) > 0;
    }
  }, {
    key: "lessThanOrEqual",
    value: function lessThanOrEqual(a, b) {
      return this.lessThan(a, b) || this.equal(a, b);
    }
  }, {
    key: "greaterThanOrEqual",
    value: function greaterThanOrEqual(a, b) {
      return this.greaterThan(a, b) || this.equal(a, b);
    }
  }, {
    key: "reverse",
    value: function reverse() {
      var compareOriginal = this.compare;
      this.compare = function (a, b) {
        return compareOriginal(b, a);
      };
    }
  }], [{
    key: "defaultCompareFunction",
    value: function defaultCompareFunction(a, b) {
      if (a === b) {
        return 0;
      }

      return a < b ? -1 : 1;
    }
  }]);

  return Comparator;
}();

exports.default = Comparator;