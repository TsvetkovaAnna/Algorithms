import Foundation

class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var area = 0
        
        var l = 0
        var r = height.count - 1
        
        while l < r {
            let mainHeight = min(height[l], height[r])
            let length = r - l
            let currentArea = length * mainHeight
            area = max(currentArea, area)
            if height[l] <= height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        
        return area
    }
}

let sol = Solution()
let t1 = sol.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])
let t2 = sol.maxArea([1, 1])
print(t1)
print(t2)

//while r < height.count {
//    let mainHeight = min(height[l], height[r])
//    let length = r - l
//    let currentArea = length * mainHeight
//    area = currentArea > area ? currentArea : area
//    r += 1
//    if r == height.count {
//        l += 1
//        r = l + 1
//    }
//}
