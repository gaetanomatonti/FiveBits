//
//  FiveBits
//
//  Created by Gaetano Matonti on 04/09/21.
//

import Foundation

extension Data {
  /// Creates an instance of `Data` from a Base32 encoded `String`.
  init?(base32Encoded string: String) {
    /// The buffer of the decoding – temporarely stores the processed bits.
    /// - Note: This buffer may store more than 1 byte, so we use a `UInt64` for safety.
    var buffer: UInt64 = 0
    
    /// The amount of bits left to process.
    var bitsLeft: UInt8 = 0
    
    /// The bytes mapped from the Base32 string.
    var bytes: [UInt8] = []
    
    // Padding characters from the string can be removed as they are not necessary for the decoding.
    for char in string.replacingOccurrences(of: "=", with: "") {
      // Make space in the buffer for a new quintet of bits.
      buffer <<= 5
      
      // Get the Base32 ASCII value from the current character.
      guard let mappedCharacter = char.base32DecodingASCII() else {
        return nil
      }
      
      // Add the character to the buffer.
      buffer |= UInt64(mappedCharacter)
      // Increase the bits counter.
      bitsLeft += 5
      
      if bitsLeft >= 8 {
        let byte = UInt8(truncatingIfNeeded: buffer >> (bitsLeft - 8))
        bytes.append(byte)
        // Decrease the bits counter.
        bitsLeft -= 8
      }
    }
    
    self.init(bytes)
  }
}
