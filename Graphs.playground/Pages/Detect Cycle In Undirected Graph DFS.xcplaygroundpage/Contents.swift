/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 ## Detect a cycle in an undirected graph using DFS
 We want to detect if there’s a cycle in an undirected graph using DFS. In an undirected graph, a\
 cycle exists if you can return to a previously visited node from the current node through a path,
 without retracing your steps via the immediate parent.
 
 **Approach:**
 
 1. DFS Traversal:
 
    - We traverse the graph using Depth-First Search (DFS).
    - As we traverse, we mark each node as visited.
 
 2. Tracking Parent Node:
 
    - While visiting a node, we keep track of the parent node to avoid falsely detecting a cycle due to the bidirectional nature of undirected graphs.
 
 3. Cycle Detection:
 
    - When we encounter a previously visited node that is not the parent of the current node, it indicates a cycle.
 
 **Diagram Example:**
 
 Let’s take an example with 5 vertices and the following undirected edges:
 - (0, 1)
 - (1, 2)
 - (2, 3)
 - (3, 4)
 - (4, 1) — this edge creates a cycle.
 
 ***In the adjacency list form, the graph looks like:***
 - Example:
 0: [1] \
 1: [0, 2, 4] \
 2: [1, 3] \
 3: [2, 4] \
 4: [3, 1]
 
 ***This is what the graph looks like visually:***
 
 ```
 0 ----- 1
        / \
       2   4
        \ /
         3
 ```
 
 ***Here, the edge between vertex 4 and vertex 1 creates a cycle. Now let’s look at how DFS detects this cycle.***
 
 **Step-by-Step Explanation of the DFS Logic:**
 
 1. Start DFS from Vertex 0:
    - Vertex 0 is marked as visited.
    - We move to vertex 1 (an adjacent node of vertex 0).
 2. DFS at Vertex 1:
    - Vertex 1 is marked as visited.
    - Vertex 0 is the parent of vertex 1, so no cycle is detected through this path.
    - We move to vertex 2 (another adjacent node of vertex 1).
 3. DFS at Vertex 2:
    - Vertex 2 is marked as visited.
    - Vertex 1 is the parent of vertex 2, so no cycle is detected through this path.
    - We move to vertex 3 (an adjacent node of vertex 2).
 4.DFS at Vertex 3:
    - Vertex 3 is marked as visited.
    - Vertex 2 is the parent of vertex 3, so no cycle is detected through this path.
    - We move to vertex 4 (an adjacent node of vertex 3).
 5. DFS at Vertex 4:
    - Vertex 4 is marked as visited.
    - Vertex 3 is the parent of vertex 4, so no cycle is detected through this path.
    - We now move to vertex 1 (an adjacent node of vertex 4).
 6. Cycle Detection at Vertex 1:
    - Vertex 1 is already visited, but it is not the parent of vertex 4 (the parent of vertex 4 is vertex 3). This means we’ve found a back edge, which indicates a cycle.
 
 Since a cycle has been detected, DFS stops and the function returns true.
 
 **Key Points in Cycle Detection:**
 - Back Edge: When we encounter a node that has already been visited, and it’s not the parent of the current node, it means there’s a back edge leading to a cycle.
 - Parent Tracking: The parent helps us avoid false positives in cycle detection, ensuring that we
     ignore the immediate back edge to the parent.
 
 **Example Execution Flow:**
 1. Start at node 0, visit node 1 (parent = 0).
 2. From node 1, visit node 2 (parent = 1).
 3. From node 2, visit node 3 (parent = 2).
 4. From node 3, visit node 4 (parent = 3).
 5. From node 4, revisit node 1 (already visited, but it’s not the parent → cycle detected).
 */

extension Graph {
    
    public func detectCycle() -> Bool {
        // Array to track visited vertices
        var visited = Array(repeating: false, count: V)

        // Check for cycles in each disconnected component
        for v in 0..<V {
            if !visited[v] {
                // If cycle is found in DFS starting from vertex v, return true
                if dfsCycleDetection(v, -1, &visited) {
                    return true
                }
            }
        }
        return false
    }
    
    private func dfsCycleDetection(_ v: Int, _ parent: Int, _ visited: inout [Bool]) -> Bool {
        // Mark the current node as visited
        visited[v] = true

        // Traverse all adjacent vertices of vertex v
        for neighbor in adj[v] {
            // If the neighbor is not visited, perform DFS recursively
            if !visited[neighbor] {
                if dfsCycleDetection(neighbor, v, &visited) {
                    return true
                }
            }
            // If an adjacent vertex is visited and is not the parent of the current vertex, a cycle is found
            else if neighbor != parent {
                return true
            }
        }
        return false
    }
}

// Example usage:
let graph = Graph(5)
graph.addEdge(v: 0, w: 1)
graph.addEdge(v: 1, w: 0)  // Manually adding the reverse edge
graph.addEdge(v: 1, w: 2)
graph.addEdge(v: 2, w: 1)  // Manually adding the reverse edge
graph.addEdge(v: 2, w: 3)
graph.addEdge(v: 3, w: 2)  // Manually adding the reverse edge
graph.addEdge(v: 3, w: 4)
graph.addEdge(v: 4, w: 3)  // Manually adding the reverse edge
graph.addEdge(v: 4, w: 1)  // Cycle creating edge
graph.addEdge(v: 1, w: 4)  // Manually adding the reverse edge



if graph.detectCycle() {
    print("Cycle detected!")
} else {
    print("No cycle detected.")
}

// Example usage:
let nGraph = Graph(5)
nGraph.addEdge(v: 0, w: 1)
nGraph.addEdge(v: 1, w: 0)  // Manually adding the reverse edge
nGraph.addEdge(v: 1, w: 2)
nGraph.addEdge(v: 2, w: 1)  // Manually adding the reverse edge
nGraph.addEdge(v: 1, w: 3)
nGraph.addEdge(v: 3, w: 1)  // Manually adding the reverse edge
nGraph.addEdge(v: 3, w: 4)
nGraph.addEdge(v: 4, w: 3)  // Manually adding the reverse edge

if nGraph.detectCycle() {
    print("Cycle detected!")
} else {
    print("No cycle detected.")
}
