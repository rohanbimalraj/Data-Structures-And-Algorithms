/*: [< Previous](@previous)          [Home](Introduction)           [Next >](@next)
 ## Depth First Search
 The following code demonstrates **DFS**
 ### Real world use cases
 - Path Finding
 - Unique Solutions
 - Cycle Detection
 */
extension Graph {
    
    // DFS traversal from a given source s
    func DFS(s: Int) -> [Int] {
        
        var result = [Int]()
        
        // Mark all vertices as not visited
        var visited = adj.map { _ in false }
        
        // Create DFS Stack
        var stack = Stack<Int>()
        
        // Mark first vertex as visited and enqueue
        //        print("Starting at \(s)")
        visited[s] = true
        stack.push(s)
        
        while stack.count > 0 {
            let current = stack.pop()!
            //            print("Popping \(current)")
            result.append(current)
            
            // Iterate over all neighbours adding to queue and popping deep as we go
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    //                    print("Pushing - \(n)")
                    stack.push(n)
                }
            }
        }
        
        return result
    }
}

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
print(g.DFS(s: 0))
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
print(g.DFS(s: 0))
print("--------------------END--------------------")
