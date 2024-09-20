//: [Previous](@previous)

import Foundation

// # Container With Most Water

/*
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.

  

 Example 1:

 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.

 Example 2:

 Input: height = [1,1]
 Output: 1

  

 Constraints:

     n == height.length
     2 <= n <= 105
     0 <= height[i] <= 104

 
 The current formulation of the problem doesn't make any sense. After having seen the solution, I've found the following clarification to be needed:

 Forget about water; that only confuses things. The problem is just about finding a maximum area rectangle. The water formulation made me think that for there to be a container, all lines between the container ends must be lower than the ends. I didn't get to see examples of this not being the case because my solution timed out.

 Also, the formulation doesn't tell what the function should actually return. A more correct formulation would thus be something like:

 "[...]. All pairs of the n lines define a rectangle with a height given by the shorter line and a width given by the distance between the lines. Return the area of the rectangle with the largest area."

 */

// Original Function - it works, but long runtime
func maxArea(_ height: [Int]) -> Int {
    if height.count == 2 {
        if height[0] <= height[1] {
            return height[0] * 1
        }
        else if height[0] >= height[1] {
            return height[1] * 1
        }
        
    }
    var left: Int = 0
    var right: Int = height.count-1
    var maxValue = Int.min
    
    while (left != right) {
        if height[left] <= height[right] {
            maxValue = max(maxValue, height[left] * abs(left-right))
            left += 1
        }
        else if height[left] > height[right] {
            maxValue = max(maxValue, height[right] * abs(left-right))
            right -= 1
        }
    }
    
    return maxValue
}

// Another users solution
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var maxArea = Int.min
        var low = 0
        var hight = height.count - 1

        while low < hight {
            let area = min(height[low], height[hight]) * (hight - low)

            maxArea = max(area, maxArea)

            if height[low] < height[hight] {
                low += 1
            } else {
                hight -= 1
            }
        }

        return maxArea
    }
}

//: [Next](@next)
