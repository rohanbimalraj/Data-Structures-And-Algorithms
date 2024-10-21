//
//  Untitled.swift
//  
//
//  Created by Rohan Bimal Raj on 21/10/24.
//

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
