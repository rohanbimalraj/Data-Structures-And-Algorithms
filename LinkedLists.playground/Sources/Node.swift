//
//  Node.swift
//  
//
//  Created by Rohan Bimal Raj on 20/10/24.
//

public class Node {
    public let data: Int
    public var next: Node?
    
    public init(data: Int, node: Node? = nil) {
        self.data = data
        self.next = node
    }
}
