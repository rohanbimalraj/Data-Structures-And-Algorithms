/*: [< Previous](@previous)          [Home](1.Introduction)           [Next >](@next)
 # Length Of Linked List
 
 */

func length(_ head: Node?) -> Int {
    
    guard head != nil else { return 0 }
    
    var len = 0
    var currentNode = head
    
    while currentNode != nil {
        len += 1
        currentNode = currentNode?.next
    }
    return len
}

// 1 2 3 4 5 6
let node6 = Node(data: 6)
let node5 = Node(data: 5, node: node6)
let node4 = Node(data: 4, node: node5)
let node3 = Node(data: 3, node: node4)
let node2 = Node(data: 2, node: node3)
let node1 = Node(data: 1, node: node2)

length(nil)
length(node1)
