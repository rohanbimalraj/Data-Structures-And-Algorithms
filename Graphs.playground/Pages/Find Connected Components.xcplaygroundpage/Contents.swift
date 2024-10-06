/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 # Find the number of connected components in an undirected graph.
 To find the number of connected components in an undirected graph, you can use either Depth-First
 Search (DFS) or Breadth-First Search (BFS). The idea is to traverse the graph from any unvisited
 vertex and mark all the vertices connected to it as visited, which forms one connected component.
 Then, continue with any unvisited vertex to find the next component, and so on.
 
 ## Approach:
 
 1. Start from any unvisited vertex and perform DFS/BFS to visit all vertices connected to it.
 2. Mark these vertices as visited.
 3. Increment the count of connected components.
 4. Repeat the process for all unvisited vertices until all vertices have been visited.
 
 ## DFS Implementation:
 */

extension Graph {
    
    // Helper function to perform DFS from a given vertex using recursion
    private func dfs(_ v: Int, _ visited: inout [Bool]) {
        visited[v] = true
        
        for neighbor in adj[v] {
            
            if visited[neighbor] == false {
                dfs(neighbor, &visited)
            }
        }
    }
    // Helper function to perform iterative DFS from a given vertex (using Stack struct)
//    private func dfs(_ v: Int, _ visited: inout [Bool]) {
//        var stack = Stack<Int>()     // Explicit stack to simulate recursion
//        stack.push(v)
//        
//        while !stack.isEmpty {
//            let current = stack.pop()!
//            
//            if !visited[current] {
//                visited[current] = true
//                
//                // Visit all unvisited neighbors
//                for neighbor in adj[current] {
//                    if !visited[neighbor] {
//                        stack.push(neighbor)
//                    }
//                }
//            }
//        }
//    }
    
    // Function to find the number of connected components
    public func connectedComponents() -> Int {
        var visited = Array(repeating: false, count: V)
        var count = 0
        
        for v in 0..<V {
            if visited[v] == false {
                dfs(v, &visited)
                count += 1
            }
        }
        return count
    }
}

// Example usage:
let graph = Graph(6)

// Adding edges (this forms two connected components)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 1, w: 0) // reverse edge
graph.addEdge(v: 1, w: 2)
graph.addEdge(v: 2, w: 1) // reverse edge

graph.addEdge(v: 3, w: 4)
graph.addEdge(v: 4, w: 3) // reverse edge
graph.addEdge(v: 4, w: 5)
graph.addEdge(v: 5, w: 4) // reverse edge

// Finding the number of connected components
let componentCount = graph.connectedComponents()
print("Number of connected components: \(componentCount)")

/*:
 
 ## Example:
 
 In this example, we have 6 vertices and the following edges:
 
 ```
 Component 1:
 0 ----- 1 ----- 2

 Component 2:
 3 ----- 4 ----- 5
 
 • (0, 1)
 • (1, 2)
 • (3, 4)
 • (4, 5)
 ```
 
 The graph is divided into **two connected components**:
 1. Component 1: {0, 1, 2}
 2. Component 2: {3, 4, 5}
 
 **Explanation:**
 
 - DFS is used to traverse each component of the graph, starting from an unvisited vertex.
 - The connectedComponents() function keeps track of how many separate traversals are made (each
 traversal corresponds to a connected component).
 - In this case, there are two distinct sets of vertices that are not connected to each other, so the
 output is 2.
 */
