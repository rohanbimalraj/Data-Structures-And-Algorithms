/*: [< Previous](@previous)          [Home](1.Introduction)           [Next >](@next)
 # Basic Operations
 - Add Front
 - Get First
 - Add Back
 - Get Last
 - Insert
 - Delete
 */

class LinkedList {
    
    private var head: Node?
    
    var isEmpty: Bool {
        head == nil
    }
    
    func addFront(_ data: Int) {
        
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? {
        guard head != nil else { return nil }
        return head?.data
    }
    
    func addBack(_ data: Int) {
        let newNode = Node(data: data)
        
        guard head != nil else {
            head = newNode
            return
        }
        
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        currentNode?.next = newNode
    }
    
    func getLast() -> Int? {
        
        guard head != nil else  {
            return nil
        }
        
        var currentNode = head
        
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        
        return currentNode?.data
    }
    
    func insert(_ data: Int, at position: Int) {
        
        if position == 0 {
            addFront(data)
        }
        
        let newNode = Node(data: data)
        var currentNode = head
        
        for _ in 0..<position - 1 {
            currentNode = currentNode?.next
        }
        
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    func deleteLast() {
        
        var currentNode = head
        var previousNode: Node?
        
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        
        if position == 0 {
            deleteFirst()
            return
        }
        
        var currentNode = head
        var previousNode: Node?
        
        for _ in 0..<position {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        previousNode?.next = currentNode?.next
    }
    
    func clear() {
        head = nil
    }
    
    func printLinkedList() {
        
        guard head != nil else { return }
        
        var result: [Int] = []
        var currentNode = head
        
        result.append(currentNode!.data)
        
        while currentNode?.next != nil {
            
            result.append(currentNode!.next!.data)
            currentNode = currentNode?.next
        }
        
        print(result)
    }
}

// Example for Add Front
let linkedList = LinkedList()
linkedList.addFront(3)
linkedList.addFront(2)
linkedList.addFront(1)
linkedList.printLinkedList()

// Example for Get First
linkedList.getFirst()

// Example for Add Back
linkedList.addBack(4)
linkedList.printLinkedList()

// Example for Get Last
linkedList.getLast()

// Example for Insert
linkedList.insert(5, at: 2)
linkedList.printLinkedList()

// Example for Delete First
linkedList.deleteFirst()
linkedList.printLinkedList()

// Example for Delete Last
linkedList.deleteLast()
linkedList.printLinkedList()

// Example for delete at
linkedList.delete(at: 1)
linkedList.printLinkedList()

linkedList.isEmpty
linkedList.clear()
linkedList.printLinkedList()
linkedList.isEmpty
