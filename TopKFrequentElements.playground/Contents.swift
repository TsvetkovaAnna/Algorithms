import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var top = [Int]()
        
        if Set(nums).count == nums.count {
            for i in 0..<k {
                top.append(nums[i])
            }
        } else {
            var dict = [Int: Int]()
            for i in nums {
                dict[i] = (dict[i] ?? 0) + 1
            }
            let sorted = dict.sorted { $0.value > $1.value}
            for item in sorted where top.count < k {
                top.append(item.key)
            }
        }
        return top
    }
}
let nums = [1,1,1,2,2,3]//2
let sol = Solution()
sol.topKFrequent(nums, 2)
