import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var l1 = l1
        var l2 = l2

        var prev = ListNode(0)
        let head = prev
        var carry = 0
        
        while l1 != nil || l2 != nil || carry != 0 {
            let current = ListNode(0)
            let sum = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + carry
            current.val = sum % 10
            carry = sum / 10
            prev.next = current
            prev = current
            l1 = l1 == nil ? l1 : l1?.next
            l2 = l2 == nil ? l2 : l2?.next
        }
        
        return head.next
    }
}

let l10 = ListNode(2, l11)
let l11 = ListNode(4, l12)
let l12 = ListNode(3)

let l20 = ListNode(5, l21)
let l21 = ListNode(6, l22)
let l22 = ListNode(4)

let sol = Solution()
sol.addTwoNumbers(l10, l20)?.val
