//
//  simple.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

/// 20. 有效的括号
/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
  

 示例 1：

 输入：s = "()"
 输出：true
 示例 2：

 输入：s = "()[]{}"
 输出：true
 示例 3：

 输入：s = "(]"
 输出：false

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/valid-parentheses
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_20 {
    
    /// 自己实现
    /// 解题思路
    /// - 使用 map ，成对匹配好对应关系
    /// - 在结合使用栈先进后出的方式匹配，如果是左括号就压栈，如果是右括号，则看栈顶是否是对应的左括号，是则出栈，否则压栈
    /// - 最后如果栈是空的，说明字符串中全部的括号都是匹配的，否则就是不匹配的
    /// - 时间复杂度为 O(n)
    /// - 空间复杂度为 O(n)
    func isValid(_ s: String) -> Bool {
        if s.count < 1 || s.count % 2 != 0 {
            return false
        }
        let map:[String:String] = [")":"(", "]":"[", "}": "{"]
        var stack: [String] = []
        let sArray: [String] = s.map { String($0) }
        for char in sArray {
            if let left = map[char] {
                if stack.last == left {
                    let _ = stack.popLast()
                } else {
                    stack.append(char)
                }
            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}


/// 14. 最长公共前缀
/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

  

 示例 1：

 输入：strs = ["flower","flow","flight"]
 输出："fl"
 示例 2：

 输入：strs = ["dog","racecar","car"]
 输出：""
 解释：输入不存在公共前缀。
  

 提示：

 1 <= strs.length <= 200
 0 <= strs[i].length <= 200
 strs[i] 仅由小写英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/longest-common-prefix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_14 {
    
    /// 自己实现
    /// 取出字符数最短的字符串
    /// 每次减少一位遍历该字符串长度，去对比其他字符串
    /// 时间复杂度 O (n * min(length))，实际复杂度会小于这个值
    /// 空间复杂度 O(1)
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        if strs.count == 1 {
            return strs[0]
        }
        let shortStr: String! = strs.min { str1, str2 in
            str1.count < str2.count
        }
                
        var offset = shortStr.count
        var resultStr = ""
    flag: while offset > 0 {
            let compareStr = shortStr[shortStr.startIndex ..< shortStr.index(shortStr.startIndex, offsetBy: offset)]
            for str in strs {
                if !str.hasPrefix(compareStr) {
                    offset -= 1
                    continue flag
                }
            }
            resultStr = String(compareStr)
            break
        }
        return resultStr
    }
}

/// 9.回文数
/*
 给你一个整数 x ，如果 x 是一个回文整数，返回 true ；否则，返回 false 。

 回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 例如，121 是回文，而 123 不是。
  

 示例 1：

 输入：x = 121
 输出：true
 示例 2：

 输入：x = -121
 输出：false
 解释：从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 示例 3：

 输入：x = 10
 输出：false
 解释：从右向左读, 为 01 。因此它不是一个回文数。
  

 提示：

 -231 <= x <= 231 - 1
  

 进阶：你能不将整数转为字符串来解决这个问题吗？

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/palindrome-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_9 {
    /// 最优解
    /// - 仅反转整数小的那一半
    /// - 剩余整数大的那一半 进行比较
    /// - 如果大半等于小半相等或者小半/10，则是回文串
    /// 时间复杂度 O(log n)
    /// 空间复杂度 O(1)
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var num = x
        var reversedNumber = 0
        while (num > reversedNumber) {
            reversedNumber = reversedNumber * 10 + num % 10
            num /= 10
        }
        return num == reversedNumber || num == reversedNumber / 10
    }
    
    /// 自己实现
    /// - % 10 取出每一位数存于数组中
    /// - 再用双指针头尾遍历获得
    /// - 时间复杂度 O(n) ，空间复杂度 O(ln)
    func isPalindrome12(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        var stack: [Int] = []
        var num = x
        repeat {
            stack.append(num % 10)
            num /= 10
        } while num > 0
        
        var l = 0
        var r = stack.count - 1
        while l < r {
            if stack[l] != stack[r] {
                return false
            }
            l += 1
            r -= 1
        }
        return true
    }
    
    /// 自己实现
    /// - 将 Int 型转换成 String
    /// - 用字符串自带方法 reversed() 反转字符串
    /// - 再用反转的字符串与原字符串比较
    func isPalindrome_11(_ x: Int) -> Bool {
        if x < 0 || (x % 10 == 0 && x != 0) {
            return false
        }
        let string = String(x)
        let reversed = String(string.reversed())
        return string == reversed
    }
}
