//: [Previous](@previous)

import Foundation
// Hashmap problem
/*
 # 242. Valid Anagram
 
 Given two strings s and t, return true if t is an
 anagram
 of s, and false otherwise.

  

 Example 1:

 Input: s = "anagram", t = "nagaram"

 Output: true

 Example 2:

 Input: s = "rat", t = "car"

 Output: false

  

 Constraints:

     1 <= s.length, t.length <= 5 * 104
     s and t consist of lowercase English letters.

  

 Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
 */

func isAnagram(_ s: String, _ t: String) -> Bool {
    var dictOne = [String:Int]()
    var dictTwo = [String:Int]()
    if s.count == t.count {
        s.map { ch in
            if let val = dictOne[String(ch)] {
                dictOne[String(ch)] = 1 + val
            }
            else {
                dictOne[String(ch)] = 1
            }
        }
        t.map { ch in
            if let val = dictTwo[String(ch)] {
                dictTwo[String(ch)] = 1 + val
            }
            else {
                dictTwo[String(ch)] = 1
            }
        }
    }
    else {
        return false
    }
    return dictOne == dictTwo ? true : false
}

isAnagram("anagram", "nagaram")

//MARK: Other User solutions

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }

        var dict = [Character: Int]()

        for char in s {
            dict[char, default: 0] += 1
        }

        for char in t {
            if let count = dict[char], count > 0 {
                dict[char] = count - 1
            } else {
                return false
            }
        }

        return true
    }
}

class Solution2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        s.sorted() == t.sorted()
    }
}

//: [Next](@next)
