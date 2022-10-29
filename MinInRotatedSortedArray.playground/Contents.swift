import Foundation

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var min: Int = nums[0]
        
        var left = 0
        var right = nums.count - 1
        if nums[left] > nums[right] {
            while left < right {
                let mid = (left + right)/2
                if nums[mid] > nums[mid + 1] {
                    min = nums[mid + 1]
                    break
                }
                if nums[mid - 1] > nums[mid] {
                    min = nums[mid]
                    break
                }
                if nums[mid] > nums[left] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
        return min
    }
}

let sol = Solution()
sol.findMin([4, 5, 6, 7, 2, 3])
sol.findMin([3,4,5,1,2])
sol.findMin([4,5,6,7,0,1,2])
sol.findMin([4,5,6,7,0,1,2])
sol.findMin([11,13,15,17])
sol.findMin([5])
sol.findMin([4,5,3])
sol.findMin([3,1,2])

