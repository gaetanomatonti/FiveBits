//
//  FiveBits
//
//  Created by Gaetano Matonti on 04/09/21.
//

import XCTest
@testable import FiveBits

/// The test case for the `Data` extension.
/// - Note: Test dataset from [page 12](https://datatracker.ietf.org/doc/html/rfc4648#page-12)
/// of the [RFC-4648](https://datatracker.ietf.org/doc/html/rfc4648) specifications.
final class DataTests: XCTestCase {
  func testBase32Decoding() throws {
    let strings = [
      "",
      "MY======",
      "MZXQ====",
      "MZXW6===",
      "MZXW6YQ=",
      "MZXW6YTB",
      "MZXW6YTBOI======"
    ]
    
    let expectedResults = [
      "",
      "f",
      "fo",
      "foo",
      "foob",
      "fooba",
      "foobar"
    ]
    
    for index in strings.indices {
      let encodedString = strings[index]
      let decodedData = try XCTUnwrap(Data(base32Encoded: encodedString))
      let resultString = try XCTUnwrap(String(data: decodedData, encoding: .ascii))
      XCTAssertEqual(resultString, expectedResults[index])
    }
  }
  
  func testBase32SecretDecoding() throws {
    let secret = "JBSWY3DPEHPK3PXP"
    let data = try XCTUnwrap(Data(base32Encoded: secret))
    let bytes = data.map { $0 }
    let expectedResults: [UInt8] = [0x48, 0x65, 0x6C, 0x6C, 0x6F, 0x21, 0xDE, 0xAD, 0xBE, 0xEF]
    XCTAssertEqual(bytes, expectedResults)
  }
}
