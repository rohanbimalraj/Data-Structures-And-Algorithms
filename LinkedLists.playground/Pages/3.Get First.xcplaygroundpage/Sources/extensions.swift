//
//  extensions.swift
//  
//
//  Created by Rohan Bimal Raj on 20/10/24.
//

public extension LinkedList {
    
    func addFront(_ data: Int) {
        
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
}
