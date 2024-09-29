import Foundation

public struct Queue<T> {
    private var array: [T]
    
    public init() {
        array = []
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func add(_ element: T) {
        array.append(element)
    }
    
    public mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
}

