import Foundation

class Solution { // easy-fast :)
    func search(_ nums: [Int], _ target: Int) -> Bool {
        let set = Set(nums)
        if set.contains(target) {
            return true
        } else {
            return false
        }
    }
}
