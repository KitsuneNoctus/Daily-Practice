//: [Previous](@previous)

import Foundation

// # Valid Parentheses
// ## Stack problem

/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

     Open brackets must be closed by the same type of brackets.
     Open brackets must be closed in the correct order.
     Every close bracket has a corresponding open bracket of the same type.

  

 Example 1:

 Input: s = "()"

 Output: true

 Example 2:

 Input: s = "()[]{}"

 Output: true

 Example 3:

 Input: s = "(]"

 Output: false

 Example 4:

 Input: s = "([])"

 Output: true

 Constraints:
     1 <= s.length <= 104
     s consists of parentheses only '()[]{}'.
 */

//MARK: WORKs ANd Passes
func isValid(_ s: String) -> Bool {
    var basicStack: [Character] = []
    for character in s {
        if character == "(" || character == "[" || character == "{" {
            basicStack.append(character)
        }
        else if character == ")" {
            if basicStack.last == "(" {
                basicStack.removeLast()
            }
            else {
                return false
            }
        }
        else if character == "]" {
            if basicStack.last == "[" {
                basicStack.removeLast()
            }
            else {
                return false
            }
        }
        else if character == "}"{
            if basicStack.last == "{" {
                basicStack.removeLast()
            }
            else {
                return false
            }
        }
    }
    if !basicStack.isEmpty {
        return false
    }
    return true
}

//MARK: Another Users Solution
class Solution {
    func isValid(_ s: String) -> Bool {
        
        guard s.count % 2 == 0 else { return false }
        
        var stack: [Character] = []
        
        for ch in s {
            switch ch {
            case "(": stack.append(")")
            case "[": stack.append("]")
            case "{": stack.append("}")
            default:
                if stack.isEmpty || stack.removeLast() != ch {
                    return false
                }
            }
        }
        
        return stack.isEmpty
    }
}

// DIDN't NEED This

//protocol Stackable {
//    associatedtype Element
//    func peek() -> Element?
//    mutating func push(_ element: Element)
//    @discardableResult mutating func pop() -> Element?
//}
//
//extension Stackable {
//    var isEmpty: Bool { peek() == nil }
//}
//
//struct Stack<Element>: Stackable where Element: Equatable {
//    private var storage = [Element]()
//    func peek() -> Element? { return storage.last }
//    mutating func push(_ element: Element) {
//        storage.append(element)
//    }
//    mutating func pop() -> Element? {
//        storage.popLast()
//    }
//}
//
//extension Stack: Equatable {
//    static func == (lhs: Stack<Element>, rhs: Stack<Element>) -> Bool { lhs.storage == rhs.storage }
//}
//
//extension Stack: ExpressibleByArrayLiteral {
//    init(arrayLiteral elements: Self.Element...) {
//        storage = elements
//    }
}

//: [Next](@next)
