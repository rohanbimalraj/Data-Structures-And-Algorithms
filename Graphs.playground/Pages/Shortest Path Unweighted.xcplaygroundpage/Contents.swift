/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 ## Find shortest path between two nodes in an unweighted graph
 Here’s how you can find the shortest path between two nodes in an unweighted graph.
 The algorithm typically used for this is ***Breadth-First Search (BFS)*** because it explores all
 neighbors at the present depth level before moving on to nodes at the next depth level. This
 guarantees the shortest path in an unweighted graph.
 */
extension Graph {
    
    func shortestPath(from source: Int, to destination: Int) -> [Int]? {
        
        if source == destination {
            return [source]
        }
        
        var queue = Queue<Int>()
        var parent: [Int: Int] = [:]
        var visisted = adj.map{ _ in false }
        
        queue.add(source)
        visisted[source] = true
        
        while queue.count > 0 {
            var current = queue.remove()!
            
            for n in adj[current] {
                if visisted[n] == false {
                    visisted[n] = true
                    queue.add(n)
                    parent[n] = current
                    
                    if n == destination {
                        var path: [Int] = []
                        var node = destination
                        
                        while let p = parent[node] {
                            path.append(node)
                            node = p
                        }
                        path.append(source)
                        return path.reversed()
                    }
                }
            }
        }
        
        return nil
    }
}

// Example usage:
let graph = Graph(7)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 0, w: 2)
graph.addEdge(v: 1, w: 3)
graph.addEdge(v: 2, w: 4)
graph.addEdge(v: 3, w: 5)
graph.addEdge(v: 4, w: 6)

if let path = graph.shortestPath(from: 0, to: 5) {
    print("Shortest path: \(path)")
} else {
    print("No path found.")
}

/*:
 ## Why is parent needed?

 When you perform BFS, you explore the graph level by level, moving from one node to its neighbors.
 The goal is to find the shortest path from the source node to the destination node. While BFS
 ensures that the shortest path is found, the actual path is not directly available during the
 traversal.

 ## To reconstruct the path:
 
 Parent Tracking: For each node, the parent dictionary keeps track of the node from which you
 arrived at that node. This allows you to “backtrack” from the destination node to the source node.

 Imagine a graph with nodes connected like this:
 */

/*
 
 0 -- 1 -- 3
 |         |
 2 -- 4 -- 5
 
 */

/*:
 Let’s say you want to find the shortest path from node 0 to node 5.\
 1.Starting at node 0, you explore its neighbors 1 and 2. At this point, your parent dictionary
 looks like this:
 
 - Example:
 parent[1] = 0\
 parent[2] = 0
 
 2.Next, you explore node 1, discovering its neighbor 3. You update the parent:
 - Example:
 parent[3] = 1
 
 3.Similarly, exploring node 2 leads to node 4:
 - Example:
 parent[4] = 2
 
 4.Then, exploring node 3 leads to node 5, the destination:
 - Example:
 parent[5] = 3
 
 Once you reach the destination node 5, you can reconstruct the path by backtracking using the parent dictionary:

     •    Start at node 5, go to parent[5] = 3.
     •    From node 3, go to parent[3] = 1.
     •    From node 1, go to parent[1] = 0.

 The shortest path is 0 -> 1 -> 3 -> 5.
 
 
 */
