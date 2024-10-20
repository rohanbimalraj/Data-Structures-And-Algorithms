//
//  LinkedList.swift
//  
//
//  Created by Rohan Bimal Raj on 20/10/24.
//

public class LinkedList {
    
    public var head: Node?
    
    public init(head: Node? = nil) {
        self.head = head
    }
    
    public func printLinkedList() {
        
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
