//
//  simple.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

/// 70. 爬楼梯
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 示例 1：
 n = 1
 1
 
 输入：n = 2
 输出：2
 解释：有两种方法可以爬到楼顶。
 1. 1 阶 + 1 阶
 2. 2 阶
 
 示例 2：
 输入：n = 3
 输出：3
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 2 阶
 3. 2 阶 + 1 阶
 
 输入：n = 4
 输出：5
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶
 2. 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 2 阶 + 1 阶
 4. 2 阶 + 1 阶 + 1 阶
 5. 2 阶 + 2 阶
 
 输入：n = 5
 输出：8
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶  + 1 阶
 2. 1 阶 + 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 1 阶 + 2 阶 + 1 阶
 4. 1 阶 + 2 阶 + 1 阶 + 1 阶
 5. 2 阶 + 1 阶 + 1 阶 + 1 阶
 6. 2 阶 + 2 阶 + 1 阶
 7. 2 阶 + 1 阶 + 2 阶
 8. 1 阶 + 2 阶 + 2 阶
 
 输入：n = 6
 输出：5
 解释：有三种方法可以爬到楼顶。
 1. 1 阶 + 1 阶 + 1 阶 + 1 阶  + 1 阶  + 1 阶
 2. 1 阶 + 1 阶 + 1 阶 + 1 阶 + 2 阶
 3. 1 阶 + 1 阶 + 1 阶 + 2 阶 + 1 阶
 4. 1 阶 + 1 阶 + 2 阶 + 1 阶 + 1 阶
 5. 1 阶 + 2 阶 + 1 阶 + 1 阶 + 1 阶
 6. 2 阶 + 1 阶 + 1 阶 + 1 阶 + 1 阶
 7. 2 阶 + 1 阶 + 2 阶 + 1 阶
 8. 1 阶 + 2 阶 + 2 阶 + 1 阶

 提示：

 1 <= n <= 45

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_70 {
    
    
    /// 累加法
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func climbStairs(_ n: Int) -> Int {
        var p = 0, q = 0, r = 1
        for _ in 0..<n {
            p = q
            q = r
            r = p + q
        }
        return r
    }
    
    /// 自己实现：累加法
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(1)
    func climbStairs11(_ n: Int) -> Int {
        var total = 0
        var n1 = 0
        var n2 = 0
        for i in 1...n {
            if i == 1 {
                n1 = 1
                total = n1
            } else if i == 2 {
                n2 = 2
                total = n2
            } else {
                total = n1 + n2
                let temp = n1
                n1 = n2
                n2 = temp + n1
            }
        }
        return total
    }
    
    
    ///  递归法 (性能非常差)
    ///  因为爬 n 阶的方法数 f(n) = f(n-1) + f(n-2)
    ///  递归累加就可以得到总方法数
    ///  - 时间复杂度 O(2^n)
    ///  - 空间复杂度 O(2^n)
    func climbStairs1(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        return climbStairs1(n-1) + climbStairs1(n-2)
    }
}


/// 21. 合并两个有序链表
/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 
 示例 2：
 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
  

 提示：

 两个链表的节点数目范围是 [0, 50]
 -100 <= Node.val <= 100
 l1 和 l2 均按 非递减顺序 排列

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
public class Solution_21 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        public init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
    }
    
    /// 合并链表 （while）
    /// 时间复杂度 O(m+n)
    /// 空间复杂度 O(1)
    /// 没有开辟更多空间，比递归实现快了很多
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        var n1 = list1, n2 = list2
        let head = ListNode(0)
        var pre: ListNode? = head
        while n1 != nil && n2 != nil {
            if n1!.val > n2!.val {
                pre?.next = n2
                n2 = n2?.next
            } else {
                pre?.next = n1
                n1 = n1?.next
            }
            pre = pre?.next
        }
        
        pre?.next = n1 != nil ? n1 : n2
        
        return head.next
    }
    
    
    /// 合并链表 (递归实现)
    /// 没想到合并有序链表可以用递归这么简单
    /// 时间复杂度 O(m+n)
    /// 空间复杂度 O(m+n)，函数栈
    func mergeTwoLists2(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        if list1!.val < list2!.val {
            list1!.next = mergeTwoLists(list1!.next, list2)
            return list1
        } else {
            list2!.next = mergeTwoLists(list1, list2!.next)
            return list2
        }
    }
    
    
    
    /// 数组转链表
    func arrayToList(_ array: [Int]) -> ListNode? {
        guard array.count > 0 else {
            return nil
        }
        var head: ListNode?
        for i in (0..<array.count).reversed() {
            if head == nil {
                head = ListNode(array[i])
            } else {
                let tmp = ListNode(array[i])
                tmp.next = head
                head = tmp
            }
        }
        return head
    }
    /// 链表转数组
    
    func listToArray(_ list: ListNode?) -> [Int] {
        guard list != nil else {
            return []
        }
        var head: ListNode? = list
        var arr: [Int] = []
        while let tmp = head {
            arr.append(tmp.val)
            head = head?.next
        }
        return arr
    }
}


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
