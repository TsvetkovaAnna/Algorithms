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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        var result = [[Int]]()
        let current = [Int]()
        
        func otnimatel(node: TreeNode, current:[Int], sum: Int) {
            //print("node \(node.val), sum: \(sum)")
            let ost = sum - node.val
            //if ost < 0 { return }
            var completed = current
            completed.append(node.val)
            
            if node.left == nil && node.right == nil {
                if ost == 0 {
                    result.append(completed)
                }
                return
            }
            
            if let left = node.left {
                otnimatel(node: left, current: completed, sum: ost)
            }
            if let right = node.right {
                otnimatel(node: right, current: completed, sum: ost)
            }
        }
        if root != nil {
            otnimatel(node: root!, current: current, sum: targetSum)
        }
        return result
    }
}

let node = TreeNode(3, TreeNode(9, TreeNode(13, TreeNode(13), nil), nil), TreeNode(20, TreeNode(15), TreeNode(7, nil, TreeNode(10, TreeNode(11), nil))))
let sol = Solution()
sol.pathSum(node, 38)
