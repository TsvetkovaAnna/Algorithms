import Foundation

class Solution {
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var top = [String]()
        var dict = [String: Int]()
        for word in words {
            dict[word] = (dict[word] ?? 0) + 1
        }
        
        var sorted = dict.sorted { $0.key < $1.key }
        sorted = sorted.sorted { $0.value > $1.value }
        
        for item in sorted where top.count < k {
            top.append(item.key)
        }
        return top
    }
}

let words = ["i","love","leetcode","i","love","coding"]//2
let words2 = ["the","day","is","day","sunny","the","the","the","sunny","is","is"]//4
let sol = Solution()
sol.topKFrequent(words2, 4)
