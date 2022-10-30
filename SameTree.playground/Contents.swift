import Foundation
//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution { //Working!!!
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        func sameVal(val1: Int?, val2: Int?) {
            
        }
        if (p?.val == nil && q?.val != nil) || (p?.val != nil && q?.val == nil) {
            return false
        }
        if p?.val == nil && q?.val == nil {
            return true
        }
        if p?.val == q?.val {
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else {
            return false
        }
    }
}

