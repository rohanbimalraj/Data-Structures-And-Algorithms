/*: [< Previous](@previous)          [Home](1.Introduction)           [Next >](@next)
 # Get First
 */
extension LinkedList {
    
    func getFirst() -> Int? {
        guard head != nil else { return nil }
        return head?.data
    }
}

let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.getFirst()
