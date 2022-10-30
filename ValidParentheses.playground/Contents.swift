import Foundation

class Solution {
    func isValid(_ s: String) -> Bool {

        if s.count%2 == 1 {
            return false
        } else {
            var arr = [Character]()
            for char in s {
                switch char {
                case ")" :
                    if arr.isEmpty { return false }
                    if arr.removeLast() != "(" { return false }
                case "}" :
                    if arr.isEmpty { return false }
                    if arr.removeLast() != "{" { return false }
                case "]" :
                    if arr.isEmpty { return false }
                    if arr.removeLast() != "[" { return false }
                default:
                    arr.append(char)
                }
            }
            return arr.isEmpty
        }
    }
}

let s = "()[]{}"
let s2 = "(}"
let sol = Solution()
sol.isValid(s)

