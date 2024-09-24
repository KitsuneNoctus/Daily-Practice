//: [Previous](@previous)

import Foundation
// Hashmap problem
/*
 49. Group Anagrams

 Given an array of strings strs, group the
 anagrams
 together. You can return the answer in any order.

  

 Example 1:

 Input: strs = ["eat","tea","tan","ate","nat","bat"]

 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

 Explanation:

     There is no string in strs that can be rearranged to form "bat".
     The strings "nat" and "tan" are anagrams as they can be rearranged to form each other.
     The strings "ate", "eat", and "tea" are anagrams as they can be rearranged to form each other.

 Example 2:

 Input: strs = [""]

 Output: [[""]]

 Example 3:

 Input: strs = ["a"]

 Output: [["a"]]

  

 Constraints:

     1 <= strs.length <= 104
     0 <= strs[i].length <= 100
     strs[i] consists of lowercase English letters.


 */
//Works! Got some assistance from discussion
// Runtime: 71ms\Beats65.31% | Memory: 17.85MB\Beats98.06%

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String:[String]]()
    strs.map {
        dict[String($0.sorted()), default: []].append($0)
    }
    return Array(dict.values)
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))

//MARK: Other user solutions

class Solution3 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        Dictionary(grouping: strs, by: { String($0.sorted()) }).values.map { $0 }
    }
}

class Solution2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [[Int]: [String]]()

        for str in strs {
            var counts = Array(repeating: 0, count: 26)
            for char in str {
                let index = Int(char.asciiValue! - 97)
                counts[index] += 1
            }
            dict[counts, default: []].append(str)
        }

        return Array(dict.values)
    }
}

class Solution1 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dict = [String: [String]]()

        for str in strs {
            let sortedStr = String(str.sorted())
            dict[sortedStr, default: []].append(str)
        }

        return Array(dict.values)
    }
}

//: [Next](@next)
