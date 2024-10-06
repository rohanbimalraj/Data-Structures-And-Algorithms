/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 ## Check if a graph is bipartite
 To check if a graph is ***bipartite***, we need to determine if we can divide the graph’s vertices
 into two
 disjoint sets such that no two vertices within the same set are adjacent. In other words, in a
 bipartite graph, we can color the graph using two colors such that no two adjacent vertices share the
 same color.
 
 **Approach:**
 
 We can use BFS or DFS to solve this problem by trying to color the graph with two colors (say, 0 and
 1). If we find any two adjacent vertices that have the same color, then the graph is not bipartite.
 
 ***Here’s the step-by-step logic for the BFS approach to check if a graph is bipartite:***
 
 1. **Coloring Vertices:**
    - Start at any unvisited vertex, color it with one color (say 0), and then attempt to color all
        its neighbors with the opposite color (1).
    - Continue this process. If at any point two adjacent vertices end up with the same color, the graph is not bipartite.
 2. **Handling Disconnected Components:**
    - If the graph is disconnected, we need to check each connected component independently. Hence, we will run the algorithm for each unvisited vertex.
 */

extension Graph {
    
    /// Function to check if the graph is bipartite
    func isBipartite() -> Bool {
        
        // Array to store colors, -1 means uncolored, 0 and 1 are the two colors
        var colors = Array(repeating: -1, count: V)
        
        // Check for every component of the graph
        for v in 0..<V {
            if colors[v] == -1 { // If the vertex is not colored
                if !bfsCheckBipartite(v, &colors) {
                    return false
                }
            }
        }
        return true
    }
    
    /// BFS utility to check if the graph is bipartite
    private func bfsCheckBipartite(_ src: Int, _ colors: inout [Int]) -> Bool {
        var queue = Queue<Int>() // can also use an array of integers
        queue.add(src)
        colors[src] = 0 // Start coloring src with color 0
        
        while queue.count > 0 {
            let u = queue.remove()!
            
            // Traverse all adjacent vertices
            for neighbor in adj[u] {
                
                if colors[neighbor] == -1 {
                    // If the neighbor hasn't been colored, color it with opposite color
                    colors[neighbor] = 1 - colors[u]
                    queue.add(neighbor)
                } else if colors[neighbor] == colors[u] {
                    // If neighbor has the same color, graph is not bipartite
                    return false
                }
            }
        }
        return true
    }
}

// Example usage:
let graph = Graph(4)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 1, w: 0)  // Manually adding reverse edge
graph.addEdge(v: 1, w: 2)
graph.addEdge(v: 2, w: 1)  // Manually adding reverse edge
graph.addEdge(v: 2, w: 3)
graph.addEdge(v: 3, w: 2)  // Manually adding reverse edge

if graph.isBipartite() {
    print("Graph is bipartite.")
} else {
    print("Graph is not bipartite.")
}

/*:
 **Explanation:**
 
 - Bipartiteness: A graph is bipartite if it can be colored with two colors such that no two adjacent vertices share the same color.
 - Color Array: We maintain a color array where color[i] is the color assigned to vertex i. If a vertex hasn’t been colored yet, it will be -1.
 - BFS: We use BFS starting from an uncolored vertex, and we attempt to color all its neighbors with the opposite color. If at any point two adjacent vertices have the same color, we know that the graph is not bipartite.
 
 Example:
 
 ```
 0 ----- 1 ----- 2 ----- 3
 
 • (0, 1)
 • (1, 2)
 • (2, 3)
 ```
 
 **In this graph:**
- Vertex 0 is connected to vertex 1.
- Vertex 1 is connected to vertex 2.
- Vertex 2 is connected to vertex 3.
 
 The graph can be colored as follows:
 ```
 0: Color 0
 1: Color 1
 2: Color 0
 3: Color 1
 ```
 
 No two adjacent vertices share the same color, so the graph is bipartite.
 
 */
 
 // Example usage:
 let nGraph = Graph(4)
nGraph.addEdge(v: 0, w: 1)
nGraph.addEdge(v: 1, w: 0)  // Manually adding reverse edge
nGraph.addEdge(v: 1, w: 2)
nGraph.addEdge(v: 2, w: 1)  // Manually adding reverse edge
nGraph.addEdge(v: 2, w: 3)
nGraph.addEdge(v: 3, w: 2)  // Manually adding reverse edge
nGraph.addEdge(v: 3, w: 0)
nGraph.addEdge(v: 0, w: 3)  // Manually adding reverse edge
nGraph.addEdge(v: 1, w: 3)
nGraph.addEdge(v: 3, w: 1)  // Manually adding reverse edge

 if nGraph.isBipartite() {
     print("Graph is bipartite.")
 } else {
     print("Graph is not bipartite.")
 }
 
/*:
 **Example of a Non-Bipartite Graph:**
 
 Consider the following undirected edges:
 
 ```
 0 ----- 1
  |     /|
  |   /  |
  | /    |
  3 ----- 2
 
 • (0, 1)
 • (1, 2)
 • (2, 3)
 • (3, 0)
 • (1, 3)
 ```
 
 **Graph Structure:**
 
 This graph contains a cycle of 4 vertices (0, 1, 2, 3), and there is an additional edge between
 vertices 1 and 3, which makes the graph non-bipartite. Here’s how it looks:
 
 **In this graph:**
 
- There is a triangle (vertices 1, 2, 3), which immediately makes it impossible to color the graph with two colors because a triangle requires three different colors to properly color it.
 
 **Why It’s Not Bipartite:**
- When we start coloring the vertices, suppose we color vertex 0 with color 0, vertex 1 with color 1, and vertex 2 with color 0 (because it’s adjacent to vertex 1).
- However, vertex 3 is adjacent to both vertex 0 and vertex 1. Since vertex 0 has color 0, we would need to color vertex 3 with color 1. But vertex 3 is also adjacent to vertex 1, which already has color 1, leading to a conflict.
- Therefore, this graph cannot be colored with two colors, and it is not bipartite.
 
 **Explanation of Code:**
 - Vertices: We create a graph with 4 vertices.
 - Edges: We add edges to form the cycle (0, 1, 2, 3) and the additional edge (1, 3), which causes the graph to be non-bipartite.
 - Bipartite Check: The BFS traversal attempts to color the graph with two colors. If a conflict arises (i.e., two adjacent vertices end up with the same color), it concludes that the graph is not bipartite.
 
 **Visualization of the Conflict:**
 
1. Start at vertex 0 (color it with 0).
2. Move to vertex 1 (color it with 1).
3. Move to vertex 2 (color it with 0).
4. Move to vertex 3 (attempt to color it with 1, since it’s adjacent to vertex 2).
5. However, vertex 3 is also adjacent to vertex 1, which is already colored 1. Therefore, a conflict occurs, and the graph is determined to be not bipartite.
 */
