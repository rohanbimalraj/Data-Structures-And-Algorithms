/*: [< Previous](@previous)          [Home](1.Introduction)           [Next >](@next)
 # Cyclic Rotation
 
 Rotate array to right N times.
 https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
 
 For example, given

     A = [3, 8, 9, 7, 6]
     K = 3
 the function should return [9, 7, 6, 3, 8]. Three rotations were made:

```
 [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
 [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
 [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
 ```
 */

func solution(A: [Int], K: Int) -> [Int] {
    
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result: [Int] = A
    
    for _ in 1...K {
        result = rotateRightOnce(result)
    }
    return result
}

func rotateRightOnce(_ A: [Int]) -> [Int] {
    
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 {
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    return newArray
}

solution(A: [1, 2, 3, 4, 5], K: 1) // 5 1 2 3 4
solution(A: [1, 2, 3, 4, 5], K: 2) // 4 5 1 2 3
solution(A: [1, 2, 3, 4, 5], K: 3) // 3 4 5 1 2

solution(A: [3, 8, 9, 7, 6], K: 3) // [9, 7, 6, 3, 8]
