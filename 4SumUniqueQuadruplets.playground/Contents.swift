import Foundation

//Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]]
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var quadroBros = [[Int]]()

        var numsS = nums.sorted()
        if nums.count < 4 {
            return quadroBros
        } else {
            for _ in 0..<(nums.count - 3) {
                let first = numsS.remove(at: 0)
                for j in 0..<(numsS.count - 2) {
                    var left = j + 1
                    var right = numsS.count - 1
                    while left < right {
                        let sum = first + numsS[j] + numsS[left] + numsS[right]
                        if target == sum {
                            quadroBros.append([first, numsS[j], numsS[left], numsS[right]])
                            left += 1
                            right -= 1
                            while numsS[left] == numsS[left - 1] && left < right {
                                left += 1
                            }
                            while numsS[right] == numsS[right + 1] && left < right {
                                right -= 1
                            }
                        } else if sum > target {
                            right -= 1
                        } else {
                            left += 1
                        }
                    }
                }
            }
        }
        return Array(Set(quadroBros))
    }
}

let nums = [-2,-1,-1,1,1,2,2] //0
let sol = Solution()
print(sol.fourSum(nums, 0))

