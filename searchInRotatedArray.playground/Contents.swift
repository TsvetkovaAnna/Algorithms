import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var targetInd = -1
        var left = 0
        var right = nums.count - 1

        while left <= right {
            let mid = (right+left)/2
            if target == nums[mid] {
                targetInd = mid
                break
            }
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target <= nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else if nums[mid] <= nums[right] {
                if nums[mid] <= target && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return targetInd
    }
}
let array = [4,5,6,7,0,1,2]
let array2 = [4,5,6,7,8,1,2,3]
let sol = Solution()
sol.search(array, 0)
sol.search(array2, 8)
