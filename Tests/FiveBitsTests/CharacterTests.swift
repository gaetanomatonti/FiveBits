import XCTest
@testable import FiveBits

/// The test case for the `Character` extension.
final class CharacterTests: XCTestCase {
  func testCharacterBase32MappingShouldBeCorrect() throws {
    let uppercaseA = Character("A")
    let uppercaseZ = Character("Z")
    let lowercaseA = Character("a")
    let lowercaseZ = Character("z")
    let two = Character("2")
    let seven = Character("7")
    
    let mappedUppercaseA = try XCTUnwrap(uppercaseA.base32DecodingASCII())
    let mappedUppercaseZ = try XCTUnwrap(uppercaseZ.base32DecodingASCII())
    let mappedLowercaseA = try XCTUnwrap(lowercaseA.base32DecodingASCII())
    let mappedLowercaseZ = try XCTUnwrap(lowercaseZ.base32DecodingASCII())
    let mappedTwo = try XCTUnwrap(two.base32DecodingASCII())
    let mappedSeven = try XCTUnwrap(seven.base32DecodingASCII())
    
    XCTAssertEqual(mappedUppercaseA, 0)
    XCTAssertEqual(mappedUppercaseZ, 25)
    XCTAssertEqual(mappedLowercaseA, 0)
    XCTAssertEqual(mappedLowercaseZ, 25)
    XCTAssertEqual(mappedTwo, 26)
    XCTAssertEqual(mappedSeven, 31)
  }
}
