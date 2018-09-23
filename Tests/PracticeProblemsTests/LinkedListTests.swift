import XCTest
@testable import PracticeProblems

final class LinkedListTests: XCTestCase {
    
    private var list: LinkedList<String>! 

    override func setUp() {
        list = LinkedList(with: "TestValue")
    }
    
    func testCanInitializeLinkedList() {
        XCTAssertNotNil(list)   
    }

    func testRootHasCorrectData() {
        let expected = true
        let result = list.contains("TestValue")
        XCTAssertEqual(expected, result)
    }

    func testRootHasCorrectCount() {
        XCTAssertEqual(1, list.count)
    }

    func testAppendIncrementsCount() {
        list.append("Value2")
        XCTAssertEqual(2, list.count)
    }

    func testAppendAddsElement() {
        list.append("Value2")
        
        let expected = true
        let result = list.contains("Value2")
        XCTAssertEqual(expected, result)
    }

    func testAppendAddsManyElements() {
        let strings = (1...100).map(toString)
        
        strings.forEach { list.append($0) }

        strings.map(list.contains).forEach(assertTrue)

        assertTrue(list.count == 101)
    }

    func testCanRemoveFirstElementWhenHead() {
        list.remove("TestValue")

        let expected = 0
        let result = list.count
        XCTAssertEqual(expected, result)
    }

    func testCanReturnFirstElementWhenRemoved() {
        let item = list.remove("TestValue")

        let expected = "TestValue"
        let result = item
        XCTAssertEqual(expected, result)
    }

    func testNolongerContainsElementOnceRemoved() {
        list.remove("TestValue")

        let expected = false
        let result = list.contains("TestValue")
        XCTAssertEqual(expected, result)
    }

    func testRemovesElementFromBack() {
        list.append("A"); list.append("B"); list.append("C");

        list.remove("C")

        let expected = false
        let result = list.contains("C")
        XCTAssertEqual(expected, result)
    }

    func testRemovesElementFromMiddle() {
        list.append("A"); list.append("B"); list.append("C");

        list.remove("B")

        let expected = false
        let result = list.contains("B")
        XCTAssertEqual(expected, result)
    }

    func testMiddleRemoveStillLinksCorrectly() {
        list.append("A"); list.append("B"); list.append("C");

        list.remove("B")

        let expected = true
        let result = list.contains("C")
        XCTAssertEqual(expected, result)
    }

    func testLinkedListIterator() {
        list.append("A"); list.append("B"); list.append("C");
        
        let elements = ["A", "B", "C"]

        for string in list {

            let expected = true
            let result = elements.contains(string)
            XCTAssertEqual(expected, result)
        }
    }

    func testClosureIterator() {
        list.append("A"); list.append("B"); list.append("C");
        
        let elements = ["A", "B", "C"]

        list.forEach { element in

            let expected = true
            let result = elements.contains(element)
            XCTAssertEqual(expected, result)
        }
    }

    func testFilteredIterator() {
        list.append("A"); list.append("B"); list.append("C");
        
        let filteredList = list
                            .filter { $0 != "C" }

        let expected = false
        let result = filteredList.contains("C")
        XCTAssertEqual(expected, result)
    }

    func testVariadicConstructorHasCorrectCount() {
        let numbers = LinkedList(of: 1, 2, 3, 4)

        let result = numbers.count
        let expected = 4
        XCTAssertEqual(expected, result)
    }

    func testVariadicOneArgHasCorrectCount() {
        let numbers = LinkedList(of: 1)

        let result = numbers.count
        let expected = 1
        XCTAssertEqual(expected, result)
    }

    func testVariadicZeroArgHasCorrectCount() {
        let numbers = LinkedList<Int>()

        let result = numbers.count
        let expected = 0
        XCTAssertEqual(expected, result)
    }

    func testVariadicZeroArgWorksProperly() {
        let numbers = LinkedList<Int>()

        numbers.append(1)
        numbers.append(2)

        let result = numbers.count
        let expected = 2
        XCTAssertEqual(expected, result)
    }

    func testVariadicZeroArgWillContainLaterAdditions() {
        let numbers = LinkedList<Int>()

        numbers.append(1)
        numbers.append(2)

        let result1 = numbers.contains(1)
        let result2 = numbers.contains(2)
        let expected = true
        XCTAssertEqual(expected, result1)
        XCTAssertEqual(expected, result2)
    }

    func testFactorialImplementation() {
        let numbers = LinkedList(of: 1, 2, 3, 4)

        let factorial = numbers.reduce(1, *)
        let expected  = 24
        XCTAssertEqual(expected, factorial)
    }

    static var allTests = [
        ("testExample", testCanInitializeLinkedList),
    ]
}

// MARK: Helper Functions 

extension LinkedListTests {

    private func toString( _ value: Int) -> String {
        return "\(value)"
    }

    private func assertTrue( _ result: Bool) {
        XCTAssertTrue(result)
    }
}
