import Foundation

//You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
//
//Merge nums1 and nums2 into a single array sorted in non-decreasing order.
//
//The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.

class SolutionMergeSortedArrays {

    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        if m == 0 {
            for i in 0..<nums2.count {
                nums1[i] = nums2[i]
            }
        }
        var mi: Int = m - 1
        var ni: Int = n - 1

        var head = nums1.count - 1
        while head >= 0 {
            if mi >= 0, ni >= 0 {
                if nums1[mi] >= nums2[ni] {
                    nums1[head] = nums1[mi]
                    mi -= 1
                } else {
                    nums1[head] = nums2[ni]
                    ni -= 1
                }
            } else if ni >= 0 {
                nums1[head] = nums2[ni]
                ni -= 1
            }
            head -= 1
        }
    }
}
