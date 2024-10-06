/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 # Find bridges in a graph
 A **bridge** in an undirected graph is an edge that, when removed, increases the number of connected
 components in the graph. In other words, it’s an edge that, if removed, would disconnect the graph or
 a portion of it.
 
 ## Key Concepts:
 - **Bridge**: An edge (u, v) is a bridge if there is no other way to travel between vertices u and v
 after removing this edge.
 - Bridges are important in network analysis, where they represent critical connections.
 
 ## Approach:
 We can find all bridges using a modified Depth-First Search (DFS). The idea is to use DFS to assign
 discovery times to vertices and check whether a back edge exists that connects a vertex to an
 ancestor in the DFS tree.
 
 ## Terminology:
 - **Discovery time**: The time at which a vertex is first visited in the DFS traversal.
 - **Low-link value**: The lowest discovery time of any vertex that can be reached from a given vertex,
 including its descendants and itself.
 - **Back edge**: A back edge is an edge that points backward from a vertex to one of its ancestors in
 the DFS tree.
 
 ```
 0 --- 1
  \   /
   \ /
    2 --- 3
 ```
 
 1. Start DFS from vertex 0.
 - 0 → 1 is a tree edge.
 - 1 → 2 is a tree edge.
 - When DFS explores vertex 2, it tries to visit 0 again, but since 0 is already visited and it is an ancestor of 2, the edge 2 → 0 is a back edge.
 
 ## Steps to find bridges:
 1. Perform a DFS, keeping track of discovery times of vertices and their low-link values.
 2. For each edge (u, v), if low[v] > disc[u], then the edge (u, v) is a bridge. This means there’s no
 back edge that connects v or its descendants to one of the ancestors of u.
 
 ## Algorithm:
 1. Use DFS to assign discovery times to each vertex.
 2. Compute the low-link value of each vertex.
 3. If for any edge (u, v), low[v] > disc[u], it’s a bridge.
 */

extension Graph {
    
    // Helper function to find bridges using DFS
    private func dfs(v: Int, parent: Int, time: inout Int, visited: inout [Bool], disc: inout [Int], low: inout [Int], bridges: inout [(Int, Int)]) {
        
        visited[v] = true
        disc[v] = time
        low[v] = time
        time += 1
        
        // Visit all neighbors of v
        for neighbor in adj[v] {
            
            if visited[neighbor] == false {
                
                // Recurse deeper
                dfs(v: neighbor, parent: v, time: &time, visited: &visited, disc: &disc, low: &low, bridges: &bridges)
                
                // After returning from recursion, update low[v]
                low[v] = min(low[v], low[neighbor])
                
                // Check if the edge v-neighbor is a bridge
                if low[neighbor] > disc[v] {
                    bridges.append((v, neighbor))
                } 
            } else if neighbor != parent {
                // Update low[v] for back edge
                low[v] = min(low[v], disc[neighbor])
            }
        }
    }
    
    public func findBridges() -> [(Int, Int)] {
        
        var visited = Array(repeating: false, count: V)
        var disc = Array(repeating: -1, count: V)  // discovery times
        var low = Array(repeating: -1, count: V)   // low-link values
        var time = 0
        var bridges = [(Int, Int)]()
        
        // Perform DFS for all unvisited vertices
        for v in 0..<V {
            if !visited[v] {
                dfs(v: v, parent: -1, time: &time, visited: &visited, disc: &disc, low: &low, bridges: &bridges)
            }
        }
        
        return bridges
    }
}

// Example usage:
let graph = Graph(5)

// Adding edges (example graph with a bridge)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 1, w: 0) // reverse edge

graph.addEdge(v: 0, w: 2)
graph.addEdge(v: 2, w: 0) // reverse edge

graph.addEdge(v: 1, w: 2)
graph.addEdge(v: 2, w: 1) // reverse edge

graph.addEdge(v: 1, w: 3)
graph.addEdge(v: 3, w: 1) // reverse edge

graph.addEdge(v: 3, w: 4)
graph.addEdge(v: 4, w: 3) // reverse edge

// Finding bridges
let bridges = graph.findBridges()
print("Bridges in the graph: \(bridges)")

/*:
 
 ## Example Graph:
 
 This graph has 5 vertices and edges:
 
 ```
 0 ----- 1
  \     / |
   \   /  |
     2    3 ----- 4
 
 • (0, 1)
 • (0, 2)
 • (1, 2)
 • (1, 3)
 • (3, 4)
 ```
 ## Explanation:
 - **Bridge (3, 4)**: If you remove the edge (3, 4), the graph becomes disconnected, with vertex 4
 isolated from the rest of the graph.
 - **Bridge (1, 3)**: If you remove the edge (1, 3), the graph splits into two components: {0, 1, 2} and
 {3, 4}.
 
 In this case, edges (3, 4) and (1, 3) are the bridges in the graph because removing them would
 increase the number of connected components.
 
 ## Time Complexity:
 - The time complexity of this algorithm is O(V + E), where V is the number of vertices and E is the
 number of edges. This is because we perform a DFS traversal, visiting each vertex and edge exactly
 once.
 
 ## Why Use DFS?
 
 DFS is particularly suited for this problem because it allows us to explore all the vertices deeply,
 making it easier to track the discovery time and low-link values, which are critical for detecting
 bridges.
 */
