import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
    public func show() -> String {
        guard let nextStr = next?.show() else { return "\(val)" }
        return "\(val) - \(nextStr)"
    }
  }

class RemoveDuplicatesFromSortedList {
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var current = head
        
        while current != nil {
            while current?.next != nil && current?.val == current?.next?.val {
                current?.next = current?.next?.next
            }
            current = current?.next
        }
        
        return head
    }
}
