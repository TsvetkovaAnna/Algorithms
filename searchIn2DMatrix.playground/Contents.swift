import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let flat = matrix.flatMap { $0 }
        if flat.contains(target) {
            return true
        } else {
            return false
        }
    }
}

let sol = Solution()
sol.searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 2)
