import XCTest
@testable import SwiftCOSE

final class SwiftCOSETests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftCOSE().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
