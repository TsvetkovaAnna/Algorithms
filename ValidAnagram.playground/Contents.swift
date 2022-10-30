import Foundation

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        var sDict = [Character: Int]()
        var tDict = [Character: Int]()
        if s.count == t.count {
            for i in s {
                if var item = sDict[i] {
                    item += 1
                    sDict[i] = item
                } else {
                    sDict[i] = 1
                }
            }
            
            for i in t {
                if var item = tDict[i] {
                    item += 1
                    tDict[i] = item
                } else {
                    tDict[i] = 1
                }
            }
            
            if sDict == tDict {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
        
    }
}

let ss = "anagram"
let tt = "nagaram"
let sol = Solution()
sol.isAnagram(ss, tt)
