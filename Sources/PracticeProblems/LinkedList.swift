
/**
An Elementary Example of a singly linked list. 
*/
public final class LinkedList<T: Equatable> {

    public init(with element: T) {
        self.data = element
    }

    public private(set) var count: Int = 1

    public var data: T?

    private var next: LinkedList<T>?
    
    /**
    Appends an element to the end of the linked list.
    a -> b -> c
    a -> b -> c -> [d]
    */
    public func append(_ element: T) {        
        next?.append(element)
        next = createIfNeeded(element, node: next)
        count.increment()
    }

    private func createIfNeeded(_ element: T, node: LinkedList<T>?) -> LinkedList<T> {
        
        if let isExistingNode = node {
            return isExistingNode
        } 
        
        return LinkedList<T>(with: element)
    }

    /**
    Removes an element from the linked list. 

    Example: removing 'c'

    [a] -> b -> c -> d 

     a -> [b] -> c -> d 

     a -> b -> [c] -> d 

     a -> b -> {c -> d}      (make c becomes d, effectively deleting c)
     
     a -> b -> d
    */
    public func remove(_ element: T) -> T? {
        
        if has(element) {
            return replaceSelfAsNext()
        }

        return next?.remove(element)
    }

    private func replaceSelfAsNext() -> T? {
        let copy = data
        
        self.data = next?.data
        self.next = next?.next

        return copy
    }

    /*  
    Contains C

    [a] -> b -> c -> d      (false, _)

    a -> [b] -> c -> d      (false, _)
    
    a -> b -> [c] -> d      (true, _)

    a -> [b] -> c -> d      (false, true)

    [a] -> b -> c -> d      (false, true) -> true
    */
    public func contains(_ element: T) -> Bool {
        
        if has(element) {
            return true
        }

        return next?.contains(element) ?? false
    }

    private func has(_ element: T) -> Bool {
        return data == element
    }
}

fileprivate extension Int {

    mutating func increment() {
        self += 1
    }

    mutating func decrement() {
        self -= 1
    }
}