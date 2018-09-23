import XCTest

extension LinkedListTests {
    static let __allTests = [
        ("testAppendAddsElement", testAppendAddsElement),
        ("testAppendAddsManyElements", testAppendAddsManyElements),
        ("testAppendIncrementsCount", testAppendIncrementsCount),
        ("testCanInitializeLinkedList", testCanInitializeLinkedList),
        ("testCanRemoveFirstElementWhenHead", testCanRemoveFirstElementWhenHead),
        ("testCanReturnFirstElementWhenRemoved", testCanReturnFirstElementWhenRemoved),
        ("testClosureIterator", testClosureIterator),
        ("testFactorialImplementation", testFactorialImplementation),
        ("testFilteredIterator", testFilteredIterator),
        ("testLinkedListIterator", testLinkedListIterator),
        ("testMiddleRemoveStillLinksCorrectly", testMiddleRemoveStillLinksCorrectly),
        ("testNolongerContainsElementOnceRemoved", testNolongerContainsElementOnceRemoved),
        ("testRemovesElementFromBack", testRemovesElementFromBack),
        ("testRemovesElementFromMiddle", testRemovesElementFromMiddle),
        ("testRootHasCorrectCount", testRootHasCorrectCount),
        ("testRootHasCorrectData", testRootHasCorrectData),
        ("testVariadicConstructorHasCorrectCount", testVariadicConstructorHasCorrectCount),
        ("testVariadicOneArgHasCorrectCount", testVariadicOneArgHasCorrectCount),
        ("testVariadicTwoArgHasCorrectCount", testVariadicTwoArgHasCorrectCount),
        ("testVariadicZeroArgHasCorrectCount", testVariadicZeroArgHasCorrectCount),
        ("testVariadicZeroArgWillContainLaterAdditions", testVariadicZeroArgWillContainLaterAdditions),
        ("testVariadicZeroArgWorksProperly", testVariadicZeroArgWorksProperly),
        ("testWorksWithHashable", testWorksWithHashable),
    ]
}

extension PracticeProblemsTests {
    static let __allTests = [
        ("testExample", testExample),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(LinkedListTests.__allTests),
        testCase(PracticeProblemsTests.__allTests),
    ]
}
#endif
