from statistics import median

def find_median(lst1, lst2):
    mid_len = (len(lst1) + len(lst2))//2
    split = mid_len//2
    lst1_mid = lst1[split:]
    lst2_mid = lst2[:-split]
    temp = lst1_mid + lst2_mid

    return median(temp)

nums1 = [1, 3]
nums2 = [2]
print(find_median(nums1, nums2))

nums1 = [1, 2]
nums2 = [3, 4]
print(find_median(nums1, nums2))

nums1 = [1,2,6]
nums2 = [5]
print(find_median(nums1, nums2))

nums1 = [1,1,1,5000, 210000]
nums2 = [0.1, 0.3, 0.5, 0.6, 0.7, 0.8, 0.9]
print(find_median(nums1, nums2))