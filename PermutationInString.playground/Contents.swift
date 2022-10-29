import Foundation

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count { return false }
        
        var s1Dict = [Character: Int]()
        for ch in s1 {
            s1Dict[ch] = (s1Dict[ch] ?? 0) + 1
        }

        let s2Arr = Array(s2)
        var l = 0
        var r = 0
        var s2Dict = [Character: Int]()
        
        while r < s2Arr.count {
            print("\(s2Arr[r])", l, r)
            if s1Dict[s2Arr[r]] != nil {
                s2Dict[s2Arr[r]] = (s2Dict[s2Arr[r]] ?? 0) + 1
                r += 1
            } else {
                s2Dict.removeAll()
                l = r + 1
                r = l
            }
                
            if (r - l) == s1.count {
                if s1Dict == s2Dict {
                    return true
                } else {
                    s2Dict[s2Arr[l]]! -= 1
                    l += 1
                }
            }
            print(l, r)
        }
        return false
    }
}
let s1 = "adc"
let s2 = "dcda"
let sol = Solution()
sol.checkInclusion(s1, s2)
