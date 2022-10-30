import Foundation

//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var arr = [Int]()
        
        while let c = current {
            arr.append(c.val)
            current = c.next
        }
        
        let count = arr.count
        
        if count > 1 {
            var cur = ListNode(arr[count - 1])
            let h = cur
            var ind = count - 2
            while ind > -1 {
                cur.next = ListNode(arr[ind])
                cur = cur.next!
                ind -= 1
            }
            return h
        }
        return head
    }
}
