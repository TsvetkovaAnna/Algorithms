import Foundation

class Solution {
    func removeAnagrams(_ words: [String]) -> [String] {
        
        if words.count == 1 {
            return words
        }
        
        var result = [words[0]]
        
        var r = 1
        var dictFirst = [Character: Int]()
        let firstArr = Array(words[0])
        for ind in 0..<firstArr.count {
            dictFirst[firstArr[ind]] = (dictFirst[firstArr[ind]] ?? 0) + 1
        }
        while r < words.count {
            let secondArr = Array(words[r])
            var seconfDict = [Character: Int]()
            for ind in 0..<secondArr.count {
                seconfDict[secondArr[ind]] = (seconfDict[secondArr[ind]] ?? 0) + 1
            }
            if dictFirst != seconfDict {
                result.append(words[r])
                dictFirst = seconfDict
            }
            r += 1
        }
        return result
    }
}
let words = ["abba","baba","bbaa","cd","cd"]
let sol = Solution()
sol.removeAnagrams(words)




