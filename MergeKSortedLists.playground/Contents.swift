import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        
        var arrays = [[Int]]()
        
        for list in lists {
            var arr = [Int]()
            var l = list
            while l != nil {
                arr.append(l!.val)
                l = l!.next
            }
            arrays.append(arr)
        }
        let sortedArr = arrays.flatMap { $0 }.sorted()
        
        if sortedArr.count == 0 {
            return nil
        } else if sortedArr.count == 1 {
            return ListNode(sortedArr[0])
        } else {
            
            var ind = 1
            var prev = ListNode(sortedArr[0])
            let head = prev
            while ind < (sortedArr.count) {
                let current = ListNode(sortedArr[ind])
                prev.next = current
                prev = current
                ind += 1
            }
            return head
        }
    }
}

let lists = [[1,4,5],[1,3,4],[2,6]]

let a0 = ListNode(1, a1)
let a1 = ListNode(4, a2)
let a2 = ListNode(5)
let b0 = ListNode(1, b1)
let b1 = ListNode(3, b2)
let b2 = ListNode(4)
let c0 = ListNode(2, c1)
let c1 = ListNode(6)

let sol = Solution()
sol.mergeKLists([a0, b0, c0])?.next?.next?.val

