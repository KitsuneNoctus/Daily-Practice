//: [Previous](@previous)

import Foundation

/*
 You are given an absolute path for a Unix-style file system, which always begins with a slash '/'. Your task is to transform this absolute path into its simplified canonical path.

 The rules of a Unix-style file system are as follows:

     A single period '.' represents the current directory.
     A double period '..' represents the previous/parent directory.
     Multiple consecutive slashes such as '//' and '///' are treated as a single slash '/'.
     Any sequence of periods that does not match the rules above should be treated as a valid directory or file name. For example, '...' and '....' are valid directory or file names.

 The simplified canonical path should follow these rules:

     The path must start with a single slash '/'.
     Directories within the path must be separated by exactly one slash '/'.
     The path must not end with a slash '/', unless it is the root directory.
     The path must not have any single or double periods ('.' and '..') used to denote current or parent directories.

 Return the simplified canonical path.

  

 Example 1:

 Input: path = "/home/"

 Output: "/home"

 Explanation:

 The trailing slash should be removed.

 Example 2:

 Input: path = "/home//foo/"

 Output: "/home/foo"

 Explanation:

 Multiple consecutive slashes are replaced by a single one.

 Example 3:

 Input: path = "/home/user/Documents/../Pictures"

 Output: "/home/user/Pictures"

 Explanation:

 A double period ".." refers to the directory up a level (the parent directory).

 Example 4:

 Input: path = "/../"

 Output: "/"

 Explanation:

 Going one level up from the root directory is not possible.

 Example 5:

 Input: path = "/.../a/../b/c/../d/./"

 Output: "/.../b/d"

 Explanation:

 "..." is a valid name for a directory in this problem.

  

 Constraints:

     1 <= path.length <= 3000
     path consists of English letters, digits, period '.', slash '/' or '_'.
     path is a valid absolute Unix path.


 */

// https://interviewing.io/questions/simplify-path
// https://leetcode.com/problems/simplify-path/?envType=study-plan-v2&envId=top-interview-150

// Used another persons code to complete.
//TODO: Work out another way to do this yourself

func simplifyPath(_ path: String) -> String {
    let pathComponents = path.split(separator: "/")
    var simpleStack = [String]()
    for component in pathComponents {
        if component == "" { continue }
        if component == "." { continue }
        if component == ".." && simpleStack.count > 0 {
            simpleStack.removeLast();
            continue
        }
        if component == ".." { continue }
        simpleStack.append(String(component))
    }
    let simplifiedPath = simpleStack.reduce("") { result, str in
        result + "/" + str
    }
    guard simplifiedPath != "" else { return "/" }
    return simplifiedPath
}

//    for ch in path {
//        if ch == "/" {
//            if cDir == ".." {
////                if simpleStack {
////                }
////                i = simpleStack.find
//            }
//            else {
////                simpleStack += "/" + cDir
//            }
//        }
//        else {
//            cDir += String(ch)
//        }
//    }
//    if simpleStack.last == "/" {
//        simpleStack.removeLast()
//    }
//    return String(simpleStack)

//: [Next](@next)
