import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var targetInd = -1
        var leftIndex = 0
        var rightIndex = nums.count - 1

        
        while leftIndex <= rightIndex {
            let midIndex = (rightIndex+leftIndex)/2
            if target == nums[midIndex] {
               targetInd = midIndex
               break
            }
            if target > nums[midIndex] {
                leftIndex = midIndex + 1
            }
            if target < nums[midIndex] {
                rightIndex = midIndex - 1
            }
        }
        
        return targetInd
    }
}

let arr = [-1, 0, 3, 5, 9, 12]
let nums = [-1,0,3,5,9,12]
let sol = Solution()
print(sol.search(nums, 2))

