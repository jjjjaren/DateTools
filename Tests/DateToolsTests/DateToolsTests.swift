import XCTest
@testable import DateTools

final class DateToolsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DateTools().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
