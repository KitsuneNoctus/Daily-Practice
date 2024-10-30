//: [Previous](@previous)

import Foundation

// #169. Majority Element
// Arrays and Strings

/*
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: 3

 Example 2:

 Input: nums = [2,2,1,1,1,2,2]
 Output: 2

  

 Constraints:

     n == nums.length
     1 <= n <= 5 * 104
     -109 <= nums[i] <= 109

  
 Follow-up: Could you solve the problem in linear time and in O(1) space?
 */

func majorityElement(_ nums: [Int]) -> Int {
    var dictionary = [Int:Int]()
    var majority: Int = nums.first!
    for num in nums {
        dictionary[num, default: 0] += 1
    }
    print(dictionary)
    for num in nums {
        if (dictionary[num] ?? 0) >= (dictionary[majority] ?? 0) {
            majority = num
        }
    }
    return majority
}

print(majorityElement([2,2,1,1,1,2,2]))
//: [Next](@next)
