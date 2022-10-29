import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [[String]]()
        var sorted = [[Character]]()
        var dict = [[Character]: [Int]]()
        
        if strs.count == 1 {
            groups.append(strs)
        } else {
            for i in strs {
                let s = i.sorted()
                sorted.append(s)
                
            }
            
            for ind in 0..<sorted.count {
                if var item = dict[sorted[ind]] {
                    item.append(ind)
                    dict[sorted[ind]] = item
                } else {
                    dict[sorted[ind]] = [ind]
                }
            }
            
            for item in dict {
                var group = [String]()
                for i in item.value {
                    group.append(strs[i])
                }
                groups.append(group)
            }
        }
//        print(groups)
//        print(dict)
        return groups
    }
}

let strs = ["eat","tea","tan","ate","nat","bat"]
let sol = Solution()
sol.groupAnagrams(strs)

//                if dict[sorted[ind]] == nil {
//                    dict[sorted[ind]] = [ind]
//                } else {
//                    var some = dict[sorted[ind]]!
//                    some.append(ind)
//                    dict[sorted[ind]]! = some
//                }
