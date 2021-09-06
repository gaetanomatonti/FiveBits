//
//  FiveBits
//
//  Created by Gaetano Matonti on 04/09/21.
//

import Foundation

extension Character {
  /// Gets the corresponding ASCII value from the Base32 alphabet.
  /// - Returns: A `UInt8` byte ASCII value of the Base32 alphabet character.
  func base32DecodingASCII() -> UInt8? {
    guard
      let character = asciiValue,
      let uppercaseA = Character("A").asciiValue,
      let uppercaseZ = Character("Z").asciiValue,
      let lowercaseA = Character("a").asciiValue,
      let lowercaseZ = Character("z").asciiValue,
      let two = Character("2").asciiValue,
      let seven = Character("7").asciiValue
    else {
      return nil
    }

    if (uppercaseA...uppercaseZ).contains(character) {
      return character - uppercaseA
    }
    if (lowercaseA...lowercaseZ).contains(character) {
      return character - lowercaseA
    }
    if (two...seven).contains(character) {
      return character - two + 26
    }
    
    return nil
  }
}
