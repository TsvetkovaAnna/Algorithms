import Foundation

class Solution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var medians = [Double]()
        
        var l = 0
        var r = k - 1
        let mid1 = k/2
        
        if k%2 == 0 {
            let mid2 = mid1 - 1
            while r < nums.count {
                var arr = [Int]()
                for i in l...r {
                    arr.append(nums[i])
                }
                arr.sort()
                
                medians.append((Double(arr[mid1]) + Double(arr[mid2]))/2)
                l += 1
                r += 1
            }
        } else {
            while r < nums.count {
                //let mid = (r + l)/2
                var arr = [Int]()
                for i in l...r {
                    arr.append(nums[i])
                }
                arr.sort()
                medians.append(Double(arr[mid1]))
                l += 1
                r += 1
            }
        }
        return medians
    }
}

class Solution2 {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        let numsD = nums.map { Double($0) }
        var medians = [Double]()
        
        var l = 0
        var r = k - 1
        let mid1 = k/2
        
        if k%2 == 0 {
            let mid2 = mid1 - 1
            while r < nums.count {
                var arr = [Double]()
                for i in l...r {
                    arr.append(numsD[i])
                }
                arr.sort()
                
                medians.append((arr[mid1] + arr[mid2])/2)
                l += 1
                r += 1
            }
        } else {
            while r < nums.count {
                var arr = [Double]()
                for i in l...r {
                    arr.append(numsD[i])
                }
                arr.sort()
                medians.append(arr[mid1])
                l += 1
                r += 1
            }
        }
        return medians
    }
}

let nums = [1,3,-1,-3,5,3,6,7]// k = 3
let sol = Solution()
print(sol.medianSlidingWindow(nums, 3))
