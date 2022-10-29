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

//first solution
func isBalanced(_ root: TreeNode?) -> Bool {
    print("Root \(root?.val ?? -1)")
    if root == nil {
        print("nil root, true")
        return true
    }
    if (root?.left == nil && root?.right == nil) {
        print("nil nodes, true")
        return true
    }
    func height(node: TreeNode?) -> Int {
        guard let node = node else { return -1 }
        print("Node: \(node.val), height: \(1 + max(height(node: node.left), height(node: node.right)))")
        return 1 + max(height(node: node.left), height(node: node.right))
    }
    if !isBalanced(root?.left) || !isBalanced(root?.right) { print("Node: \(node.val), some is false"); return false }
    print("left: \(height(node: root?.left)), right: \(height(node: root?.right)), abs: \(abs(height(node: root?.left) - height(node: root?.right))), \(abs(height(node: root?.left) - height(node: root?.right)) <= 1)")
    return abs(height(node: root?.left) - height(node: root?.right)) <= 1
    
}

let node = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7, nil, TreeNode(10, TreeNode(11), nil))))
isBalanced(node)


//second solution
class Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if (root?.left == nil && root?.right == nil) {
            return true
        }
        func height(node: TreeNode?) -> Int {
            guard let node = node else { return -1 }
            return 1 + max(height(node: node.left), height(node: node.right))
        }
        if !isBalanced(root?.left) || !isBalanced(root?.right) { return false }
        return abs(height(node: root?.left) - height(node: root?.right)) <= 1
        
    }
}

//third solution
class Solution3 {
    func isBalanced(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        if (root?.left == nil && root?.right == nil) {
            return true
        }
        func getHeight(left: TreeNode?, right: TreeNode?) -> (Int, Bool) {
            
            var max1 = 1
            var isBalanced = true
            
            var leftHeight: Int? = nil
            var rightHeight: Int? = nil
            
            if let left = left {
                let reuslt = getHeight(left: left.left, right: left.right)
                leftHeight = reuslt.0
                isBalanced = reuslt.1
            }
            
            if let right = right {
                let reuslt = getHeight(left: right.left, right: right.right)
                rightHeight = reuslt.0
                if !reuslt.1 {
                    isBalanced = false
                }
            }
            
            if let leftH = leftHeight, let rightH = rightHeight {
                let lrMax = max(leftH, rightH)
                if lrMax > max1 {
                    max1 += lrMax
                }
                
                if abs(leftH - rightH) > 1 {
                    isBalanced = false
                }
                
            } else {
                if let rightH = rightHeight, rightH >= max1 {
                    max1 += rightH
                    if rightH > 1 {
                        isBalanced = false
                    }
                }
                
                if let leftH = leftHeight, leftH >= max1 {
                    max1 += leftH
                    if leftH > 1 {
                        isBalanced = false
                    }
                }
            }
            
            if let rightH = rightHeight, rightH >= max1 {
                max1 += rightH
            }
    
    //print("(", left?.val, right?.val, ")", max1, isBalanced)
    return (max1, isBalanced)
}

return getHeight(left: root?.left, right: root?.right).1
    }
}
