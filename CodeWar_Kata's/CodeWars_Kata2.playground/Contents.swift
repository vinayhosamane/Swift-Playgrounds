import UIKit
import Foundation

/*
Description:
Encrypt this!

You want to create secret messages which can be deciphered by the Decipher this! kata. Here are the conditions:

Your message is a string containing space separated words.
You need to encrypt each word in the message using the following rules:
The first letter needs to be converted to its ASCII code.
The second letter needs to be switched with the last letter
Keepin' it simple: There are no special characters in input.
Examples:
encryptThis "Hello" == "72olle"
encryptThis "good" == "103doo"
encryptThis "hello world" == "104olle 119drlo"
 */

//For Swift 4
//extension Character {
//    var ascii: UInt32? {
//        return unicodeScalars.first?.value
//    }
//}
// Swift 5 has new api for getting ASCII value
//func encryptThis(text: String) -> String {
//    // Your awesome code goes here!
//    let allWords = text.components(separatedBy: " ")
//    let result = allWords.map { (word) -> String in
//        return applySequenceOfCipherRules(word)
//    }.joined(separator: " ")
//    return result
//}

func encryptThis(text:String) -> String {
    return text
        .components(separatedBy: " ")
        .map {
            var a = $0.map { String($0) }
            a[0] = String(a[0].unicodeScalars.first!.value)
            
            if a.count > 2 {
                a.swapAt(1, a.count-1)
            }
            
            return a.joined()
        }
        .joined(separator: " ")
}

func applySequenceOfCipherRules(_ text: String) -> String {
    //Replace first character by ascii value
    //Swap second character with last character
    var result = text
    let secondIndex = text.index(text.startIndex, offsetBy: 1)
    let lastIndex = text.index(text.endIndex, offsetBy: -1)
    
    result.swap(at: secondIndex, to: text[lastIndex])
    result.swap(at: lastIndex, to: text[secondIndex])
    
//    let temp = text[secondIndex]
//    text[secondIndex] = text[lastIndex]
//    text[secondIndex] = temp
    
//    text.enumerated().forEach { (index, char) in
//        if index == 0 {
//            guard let ascii = char.asciiValue else {
//              return
//            }
//            result.append(String(ascii))
//        } else if index == 1 {
//            result.append(text[lastIndex])
//        } else if index == text.count - 1 {
//            result.append(text[secondIndex])
//        } else {
//            result.append(char)
//        }
//    }
    
    return result
}

extension String {
    mutating func swap(at index: String.Index, to character: Character) {
        let endIndex = self.index(after: index)
        let range = index ..< endIndex
        assert(indices.contains(index) && indices.contains(endIndex))
        replaceSubrange(range, with: String(character))
    }
}

print(encryptThis(text: "hello world"))
