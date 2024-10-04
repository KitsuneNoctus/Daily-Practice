//: [Previous](@previous)

import Foundation

// 88. Merge Sorted Array
// Array / String

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var a = m - 1
    var b = n - 1
    var c = m + n - 1
    
    
    
    while a >= 0 && b >= 0 {
        if nums1[a] > nums2[b] {
            nums1[c] = nums1[a]
            a -= 1
        }
        else {
            nums1[c] = nums2[b]
            b -= 1
        }
        c -= 1
    }
    
    while b >= 0 {
        nums1[c] = nums2[b]
        b -= 1
        c -= 1
    }
}

// HAD to look at discussion and others to get solution. Need to work on this

var mergeable = [1,2,3,0,0,0]
merge(&mergeable, 3, [2,5,6], 3)

print(mergeable)

//: [Next](@next)
