import Foundation

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] { //проходит 48 тестов из 51
        
        if nums.count == 1 || k == 1{
            return nums
        } else {
            let numsCount = nums.count
            var result = Array(repeating: 0, count: (numsCount - k + 1))
            var pos = 0
            var window = [Int]()
            
            for i in 0..<numsCount {
                while !window.isEmpty && window.first! < (i - k + 1) {
                    window.removeFirst()
                }
                while !window.isEmpty && nums[window.last!] < nums[i] {
                    window.removeLast()
                }
                
                window.append(i)
                if i >= k - 1 {
                    result[pos] = nums[window.first!]
                    pos += 1
                }
                
            }
            return result
        }
    }
}
let nums2 = [1, -1] //k = 1
let nums = [1,3,-1,-3,5,3,6,7]// k = 3
let sol = Solution()
sol.maxSlidingWindow(nums, 3)



class Solution2 {  //проходит 47 тестов из 51
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for ind in 0..<nums.count {
            dict[ind] = nums[ind]
        }
        dict.sorted { $0.key > $1.key }
        
        if nums.count == 1 || k == 1{
            return nums
        } else {
            var maxims = [Int]()
            
            var l = 0
            var r = k - 1
            var window = [Int: Int]()
            
            for ind in l...r {
                window[ind] = dict[ind]
            }
            
            var max = window.values.max()!
            maxims.append(max)
            l += 1
            r += 1
            
            while r < nums.count {
                if window[l-1] == max {
                    window[l-1] = nil
                    window[r] = dict[r]
                    max = window.values.max()!
                } else {
                    window[l-1] = nil
                    window[r] = dict[r]
                    max = window[r]! > max ? window[r]! : max
                }
                maxims.append(max)
                l += 1
                r += 1
            }
            return maxims
        }
    }
}
