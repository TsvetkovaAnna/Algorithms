import Foundation

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var single = -1

        var dict = [Int: Int]()
        for i in nums {
            if dict[i] == nil {
                dict[i] = 1
            } else {
                dict[i]! += 1
            }
        }
        for i in dict {
            if i.value == 1 {
                single = i.key
            }
        }
        return single
    }
}

let nums = [4,1,2,1,2]
let sol = Solution()
sol.singleNumber(nums)
