/*: [< Previous](@previous)          [Home](1.Introduction)           [Next >](@next)
 # Add Front
 */

extension LinkedList {
    
    func addFront(_ data: Int) {
        
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
}

let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()
