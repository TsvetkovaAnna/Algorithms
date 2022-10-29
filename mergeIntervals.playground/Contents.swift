import Foundation

class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var allIntervals = intervals
        allIntervals.sort { $0[0] < $1[0]}

        var clearIntervals = [[Int]]()
        clearIntervals.append(allIntervals[0])
        
        for ind in 1..<allIntervals.count {
            
            if clearIntervals.last![1] >= allIntervals[ind][0] {
                let min = clearIntervals.last![0]
                let max = max(clearIntervals.last![1], allIntervals[ind][1])
                clearIntervals.removeLast()
                clearIntervals.append([min, max])
            } else {
                clearIntervals.append(allIntervals[ind])
            }
        }
        return clearIntervals
    }
}

let sol = Solution()
print(sol.merge([[1,3], [2,6], [15,18], [8, 10]]))

var intervals = [[1,3], [2,6], [2,5], [15,18], [8, 10]]
