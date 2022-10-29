import Foundation

final class Solution { //pwwkew
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let sArr = Array(s)
        var count:Int = 0
        
        var l = 0
        var r = 0
        var substring = [Character]()

        while r < sArr.count {
            if substring.contains(sArr[r]) {
                substring.removeAll()
                l += 1
                r = l
            } else {
                
                substring.append(sArr[r])
                r += 1
                count = substring.count > count ? substring.count : count
            }
        }
        return count
    }
}
let sol = Solution()
let t1 = sol.lengthOfLongestSubstring("dfde")
print(t1)
