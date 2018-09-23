
/**
An elementary example of a singly linked list
*/
public final class LinkedList<T: Equatable> {

    /**
    Create a new linked list

    - Parameter element: An element to add to the list. 
    */
    public convenience init(_ element: T) {
        self.init(arrayLiteral: element)
    }

    /**
    Create a new linked list

    - Parameter elements: A list of zero or more elements to add to the list. 
    */
    public init(elements: [T]) {
        var elements = elements

        if elements.isEmpty {
            count = 0
            return
        }

        self.data = elements.removeFirst()
        elements.forEach(append)
    }

    /**
    The current number of elements in the list
    */
    public private(set) var count: Int = 1

    internal var data: T?

    internal var next: LinkedList<T>?
    
    /**
    Appends an element to the end of the linked list.
    ```
    a -> b -> c
    a -> b -> c -> [d]
    ```

    - Parameter element: An element to append to the linked list. 
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
        
        return LinkedList(element)
    }

    /**
    Removes an element from the linked list. 

    - Parameter element: An element remove from this linked list
    - Returns: The element removed, if any. 
    */
    @discardableResult
    public func remove(_ element: T) -> T? {
        
        if has(element) {
            return replaceSelfAsNext()
        }

        return next?.remove(element)
    }

    private func replaceSelfAsNext() -> T? {
        count.decrement()

        let copy = data
        
        self.data = next?.data
        self.next = next?.next

        return copy
    }

    /**  
    Asserts true if the linked list contains the element. 

    - Parameter element: An element to test for membership. 
    - Returns: True if the linked list contains the element, false otherwise. 
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

extension LinkedList: Sequence {

    public func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(self)
    }
}

extension LinkedList: ExpressibleByArrayLiteral {
    
    public convenience init(arrayLiteral: T...) {
        self.init(elements: arrayLiteral)
    }
}

/**
A class for iterating through a linked List
*/
public struct LinkedListIterator<T: Equatable>: IteratorProtocol {

    private var list: LinkedList<T>?

    init(_ list: LinkedList<T>) {
        self.list = list
    }

    /**
    Returns the next element of the sequence
    */
    public mutating func next() -> T? {
        list = list?.next
        return list?.data
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