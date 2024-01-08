import Foundation

//Given a sorted array of distinct integers and a target value, return the index if the target is found. 
//If not, return the index where it would be if it were inserted in order.
// You must write an algorithm with O(log n) runtime complexity.

// Input: nums = [1,3,5,6], target = 5
// Output: 2

// 2 5 => 1
// 1 3 => 0
// 0 1 => 2

class SolutionSearchInsert {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else { return 0 }

        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            let midValue = nums[mid]

            if midValue == target {
                return mid
            } else if midValue < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return left
    }
}
