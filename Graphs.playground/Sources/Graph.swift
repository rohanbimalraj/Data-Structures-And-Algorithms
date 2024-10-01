import Foundation

public class Graph {
    public var V = 0                 // number of vertices
    public var adj = [[Int]]()      // adjacency list
    
    public init(_ V: Int) {
        self.V = V
        for _ in 0..<V {
            adj.append([Int]())     // create empty array of adjacency lists
        }
    }
    
    public func addEdge(v: Int, w: Int) {
        adj[v].append(w)
    }
}
