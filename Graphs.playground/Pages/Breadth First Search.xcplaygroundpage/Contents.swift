/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 # Breadth First Search
 The following code demonstrates **BFS**
 
 ### Real world use cases
 - Social Graphs
 - Recommendations
 - Nearest Neighbours
 */

import Foundation

extension Graph {
    
    // BFS traversal from a given source s
    func BFS(s: Int) -> [Int] {
        
        var result = [Int]()
        
        // Mark all vertices as not visited
        var visited = adj.map { _ in false }
        
        // Create BFS Queue
        var queue = Queue<Int>()
        
        // Mark first vertex as visited and enqueue
        visited[s] = true
        // print("Starting at \(s)")
        queue.add(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.remove()!
            // print("De-queueing \(current)")
            
            // Get all the adjacent vertices of the current vertex
            // If adjacent has not being visited, mark visited and enqueue
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    // print("Queuing \(n)")
                    queue.add(n)
                    result.append(n)
                }
            }
         }
        
        return result
    }
}

// Need to have as many vertices as you have edges
/*
 Directed Graph
               ┌────┐           ┌────┐      ┌────┐
 ┌────────────▶│ 5  │───────────▶ 2  │──────▶ 7  │
 │             └────┘           └────┘      └────┘
 │                |
 │                └─────────┐
 │                          │
 |                          ▼
 ┌────┐          ┌────┐     ┌────┐
 │ 1  │◀─────────│ 0  │◀────| 3  │
 └────┘          └────┘     └────┘
 |                ▲
 │                |
 ▼                |
 ┌────┐          ┌────┐
 │ 4  │──────────▶ 6  │
 └────┘          └────┘
 
 */

let g = Graph(8)
g.addEdge(v: 0, w: 1)
g.addEdge(v: 1, w: 4)
g.addEdge(v: 4, w: 6)
g.addEdge(v: 6, w: 0)
g.addEdge(v: 1, w: 5)
g.addEdge(v: 5, w: 3)
g.addEdge(v: 3, w: 0)
g.addEdge(v: 5, w: 2)
g.addEdge(v: 2, w: 7)
print("--------------------BSF DIRECTED--------------------")
print(g.BFS(s: 0))
print("--------------------END--------------------")



/*
 Undirected Graph
               ┌────┐           ┌────┐      ┌────┐
 ┌────────────▶│ 5  │◀──────────▶ 2  │◀─────▶ 7  │
 │             └────┘           └────┘      └────┘
 │                ▲
 │                └─────────┐
 │                          │
 ▼                          ▼
 ┌────┐          ┌────┐     ┌────┐
 │ 1  │◀────────▶│ 0  │◀────▶ 3  │
 └────┘          └────┘     └────┘
 ▲               │
 ▼               ▼
 ┌────┐          ┌────┐
 │ 4  │◀─────────▶ 6  │
 └────┘          └────┘
 
 */

let ng = Graph(8)
ng.addEdge(v: 0, w: 1)
ng.addEdge(v: 1, w: 0)
ng.addEdge(v: 1, w: 4)
ng.addEdge(v: 4, w: 1)
ng.addEdge(v: 4, w: 6)
ng.addEdge(v: 6, w: 4)
ng.addEdge(v: 6, w: 0)
ng.addEdge(v: 0, w: 6)
ng.addEdge(v: 1, w: 5)
ng.addEdge(v: 5, w: 1)
ng.addEdge(v: 5, w: 3)
ng.addEdge(v: 3, w: 5)
ng.addEdge(v: 3, w: 0)
ng.addEdge(v: 0, w: 3)
ng.addEdge(v: 5, w: 2)
ng.addEdge(v: 2, w: 5)
ng.addEdge(v: 2, w: 7)
ng.addEdge(v: 7, w: 2)
print("--------------------BSF UNDIRECTED--------------------")
print(g.BFS(s: 0))
print("--------------------END--------------------")
