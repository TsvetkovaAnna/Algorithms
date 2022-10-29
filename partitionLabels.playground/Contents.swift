import Foundation

class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        let arrS = Array(s)

        var countsArrays = [[Int]]()
        
        var firstLast = [[Int]]()
        
        let set = Array(Set(s))
        for ind in 0..<set.count {
            let first = arrS.firstIndex(of: set[ind])!
            let last = arrS.lastIndex(of: set[ind])!
            firstLast.append([first, last])
        }
        firstLast.sort { $0[0] < $1[0] }
        print(firstLast)
        countsArrays.append(firstLast[0])
        
        for ind in 1..<firstLast.count {
            if countsArrays.last![1] >= firstLast[ind][0] {
                let start = countsArrays.last![0]
                let fin = max(countsArrays.last![1], firstLast[ind][1])
                countsArrays.removeLast()
                countsArrays.append([start, fin])
            } else {
                countsArrays.append(firstLast[ind])
            }
        }
        return countsArrays.map { $0.reduce(0) { $1 - $0 + 1 } }.map { $0 + 1 }
    }
}

let sol = Solution()
print(sol.partitionLabels("ababcbacadefegdehijhklij"))

