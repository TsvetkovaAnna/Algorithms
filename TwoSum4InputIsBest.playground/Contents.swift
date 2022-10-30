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

class Solution2 { //shorter algorithm
    var treeSet:Set<Int> = []
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

        guard let root = root else { return false }
        
        if treeSet.contains(root.val) {
            return true
        }
        
        treeSet.insert(k - root.val)
        
        var leftBool = false
        var rightBool = false
        if let left = root.left {
            leftBool = findTarget(left, k)
        }
        if let right = root.right {
            rightBool = findTarget(right, k)
        }
        return (leftBool || rightBool)
    }
}

class Solution { //longer algorithm
    
    var treeSet:Set<Int> = []
    func findTarget(_ root: TreeNode?, _ k: Int) -> Bool {

        guard let root = root else { return false }
        
        if treeSet.contains(root.val) {
            return true
        }
        
        treeSet.insert(k - root.val)
        
        var leftBool = false
        var rightBool = false
        if let left = root.left {
            leftBool = findTarget(left, k)
        }
        if let right = root.right {
            rightBool = findTarget(right, k)
        }
        return (leftBool || rightBool)
    }
    
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var tt = t
        for ch in s {
            if tt.contains(ch) {
                let ind = tt.firstIndex(of: ch)
                tt.remove(at: ind!)
            }
        }
        let diff = tt.first!
        return diff
    }
}

let node = TreeNode(3, TreeNode(9, TreeNode(13, TreeNode(13), nil), nil), TreeNode(20, TreeNode(15), TreeNode(7, nil, TreeNode(10, TreeNode(11), nil))))
let sol = Solution()
sol.findTarget(node, 34)
sol.findTheDifference("abcd", "abcde")

