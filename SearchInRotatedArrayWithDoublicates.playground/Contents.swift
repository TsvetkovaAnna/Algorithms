import Foundation

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let set = Set(nums)
        if set.contains(target) {
            return true
        } else {
            return false
        }
    }
    func search2(_ nums: [Int], _ target: Int) -> Bool {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = (left + right)/2
            if nums[mid] == target {
                return true
            }
            if nums[mid] < nums[left] {
                if target > nums[left] {
                    right = mid - 1
                } else {
                    left = mid +  1
                }
            }
            if nums[mid] > nums[left] {
                if target < nums[left] {
                    left = mid + 1
                }
                if target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
        }
        return false
    }
}

let sol = Solution()
sol.search2([1,0,1,1,1], 0)

