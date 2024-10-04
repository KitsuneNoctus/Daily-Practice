//: [Previous](@previous)

import Foundation

//#392. Is Subsequence
// Arrays / Strings

/*
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  

 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true

 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false

  

 Constraints:

     0 <= s.length <= 100
     0 <= t.length <= 104
     s and t consist only of lowercase English letters.

  
 Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?
*/

// Works, could be better though. High runtime
func isSubsequence(_ s: String, _ t: String) -> Bool {
    var a = 0
    var b = 0
    
    while a <= s.count-1 && b <= t.count-1 {
        if s[String.Index(encodedOffset: a)] == t[String.Index(encodedOffset: b)] {
            a += 1
            b += 1
        }
        else {
            b += 1
        }
    }
    return a == s.count ? true : false
}

isSubsequence("abc", "ahbgdc")
isSubsequence("acb", "ahbgdc")
//: [Next](@next)
