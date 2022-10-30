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

class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        
        if root?.left == nil && root?.right == nil {
            return true
        }
        if (root?.left != nil && root?.right == nil) || (root?.left == nil && root?.right != nil) {
            return false
        }
        func compare(left: TreeNode?, right: TreeNode?) -> Bool {
            if left == nil && right == nil {
                return true
            }
            
            if left?.val == right?.val {
                return compare(left: left?.left, right: right?.right) && compare(left: left?.right, right: right?.left)
            } else {
                return false
            }
        }
        return compare(left: root?.left, right: root?.right)
    }
}

