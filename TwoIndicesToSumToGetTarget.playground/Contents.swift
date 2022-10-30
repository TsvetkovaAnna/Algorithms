import Foundation

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var indices = [Int]()
        var numsDel = nums
        var del = 0
        
        for i in 0..<nums.count {
            numsDel.remove(at: 0)
            del += 1
            let dis = target - nums[i]
            if numsDel.contains(dis) {
                indices.append(i)
                indices.append(numsDel.firstIndex(of: dis)! + del)
                break
            }
        }
        return indices
    }
}
let nums = [3,2,4]
let sol = Solution()
sol.twoSum(nums, 6)
