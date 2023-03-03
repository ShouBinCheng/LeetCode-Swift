//
//  medium.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

/// 5. 最长回文子串
/*
 给你一个字符串 s，找到 s 中最长的回文子串。

 如果字符串的反序与原始字符串相同，则该字符串称为回文字符串。

 示例 1：

 输入：s = "babad"
 输出："bab"
 解释："aba" 同样是符合题意的答案。
 示例 2：

 输入：s = "cbbd"
 输出："bb"
  

 提示：

 1 <= s.length <= 1000
 s 仅由数字和英文字母组成

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/longest-palindromic-substring
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_5 {
    
    /// 解法4：Manacher 算法
    /**
     Manacher算法是解决最长回文子串问题的最优解，它是一种基于回文中心的算法，可以在O(n)的时间复杂度内求解最长回文子串。

     Manacher算法的核心思想是利用已知的回文中心的信息来推导新的回文中心的信息。具体来说，我们可以维护一个回文半径数组P，其中P[i]表示以i为中心的最长回文半径。

     在计算P[i]的过程中，我们可以利用已知的回文半径来快速计算P[i]的值。具体来说，我们可以维护两个变量，分别表示当前已知的最右回文边界R和最右回文边界对应的回文中心C。在计算P[i]的过程中，我们可以根据i与C的距离来判断i是否在R的左侧或右侧。

     如果i在R的左侧，那么我们可以利用已知的回文中心的信息来快速计算P[i]的初值，然后向左右两侧扩展，直到找到最长的回文半径。

     如果i在R的右侧，那么我们只能暴力扩展，直到找到最长的回文半径。

     在计算P[i]的过程中，我们还需要维护一个变量maxRight，表示已知的回文半径的最右边界。如果i+P[i]超过了maxRight，那么我们需要更新maxRight和C的值。

     时间复杂度为O(n)，空间复杂度为O(n)。
     */
    
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty {
            return s
        }
        
        let arr = Array(s)
        
        var maxLength = 1
        var beginP = 0
        var i = 0
        
        while i < arr.count {
            var l = i - 1
            var r = i
            while r < arr.count && arr[i] == arr[r] {
                r += 1
            }
            i = r
            while l >= 0 && r < arr.count && arr[l] == arr[r] {
                l -= 1
                r += 1
            }
            
            let length = (r-l-1)
            if length > maxLength {
                maxLength = length
                beginP = l+1
            }
        }
        
        let subStr: Substring = s.dropFirst(beginP).prefix(maxLength)
        print("\(subStr)")
        
        return String(subStr)
    }
    
    /// 解法3：中心扩展法
    /// 中心扩展法是一种优化的枚举方法，我们可以枚举所有的回文中心，然后向两边扩展，直到找到最长的回文串。
    /// 回文中心有两种情况，一种是一个字符，另一种是两个相邻的字符。因此，我们可以枚举所有的字符和相邻的字符，将他们当作回文中心，然后向两边扩展。
    /// - 时间复杂度 O(n^2)
    /// - 空间复杂度 O(1)
    func longestPalindrome13(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var ans = ""
        func expandAroundCenter(_ left: Int, _ right: Int) -> String {
            var l = left, r = right
            while l >= 0 && r < n && chars[l] == chars[r] {
                l -= 1
                r += 1
            }
            return String(chars[l+1..<r])
        }
        
        for i in 0..<n {
            let s1 = expandAroundCenter(i, i)
            let s2 = expandAroundCenter(i, i+1)
            if s1.count > ans.count {
                ans = s1
            }
            if s2.count > ans.count {
                ans = s2
            }
        }
        return ans
    }
    
    
    ///解法2: 动态规划  (LeetCode 测试超时，可能是内存使用太多导致)
    ///动态规划是解决最长回文子串问题的最优解，我们可以定义一个二维数组 dp，其中 dp[i][j]表示从i到j的子串是否是回文串。
    ///状态转移方程如下：
    ///当i==j时，dp[i][j] = true
    ///当i+1==j时，dp[i][j] = s[i] == s[j]
    ///当i+1<j时，dp[i][j] = dp[i+1][j-1] && s[i] == s[j]
    ///其中，dp[i+1][j-1]表示去掉s[i]和s[j]之后的子串是否是回文串。
    ///- 时间复杂度为 O(n^2)
    ///- 空间复杂度为 O(n^2)
    func longestPalindrome12(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var ans = ""
        
        for i in (0..<n).reversed() {
            for j in i..<n {
                dp[i][j] = (chars[i] == chars[j]  && (j-i <= 2 || dp[i+1][j-1]))
                if dp[i][j] && j-i+1 >= ans.count {
                    ans = String(chars[i...j])
                }
            }
        }
        return ans
    }
    
    
    /// 解法1：暴力枚举 （LeetCode 超时）
    /// 暴力枚举是最简单的方法，我们可以枚举所有的子串，判断它是否是回文串，并记录最长的回文串
    /// - 时间复杂度 O(n^3)
    /// - 空间复杂度 O(1)
    func longestPalindrome11(_ s: String) -> String {
        let chars = Array(s)
        let n = chars.count
        var ans = ""
        for i in 0..<n {
            for j in i..<n {
                var isPalindrome = true
                for k in 0..<(j-i+1)/2 {
                    if chars[i+k] != chars[j-k] {
                        isPalindrome = false
                        break
                    }
                }
                if isPalindrome && j-i+1 > ans.count {
                    ans = String(chars[i...j])
                }
            }
        }
        return ans
    }

}

/// 2. 两数相加
/*
 给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。

 请你将两个数相加，并以相同形式返回一个表示和的链表。

 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。

  

 示例 1：


 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：

 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：

 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution_2 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /// 遍历链表就好了
    /// 分别把两个链表压栈
    /// 再出栈相加创建新的链表
    /// - 时间复杂度 O(max(m,n))
    /// - 空间复杂度 O(1)
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let newList = ListNode(0)
        var curPrev: ListNode?
        var prev1 = l1
        var prev2 = l2
        while prev1 != nil && prev2 != nil {
            newList.val += prev1!.val + prev2!.val
            let node = ListNode(newList.val % 10)
            newList.val /= 10
            if newList.next == nil {
                newList.next = node
            }
            curPrev?.next = node
            curPrev = node
            prev1 = prev1?.next
            prev2 = prev2?.next
        }
        
        var notEmp = prev1 == nil ? prev2 : prev1
        while notEmp != nil {
            newList.val += notEmp!.val
            let node = ListNode(newList.val % 10)
            newList.val /= 10
            if newList.next == nil {
                newList.next = node
            }
            curPrev?.next = node
            curPrev = node
            notEmp = notEmp?.next
        }
        
        if newList.val > 0 {
            curPrev?.next = ListNode(newList.val)
        }
        return newList.next
    }
    
    /// 数组创建链表
    /// - Parameters:
    ///   - nums: 数组
    ///   - pos: 环点的位置， -1 则无环
    /// - Returns: head
    func buildListWith(nums: [Int], pos: Int) -> ListNode? {
        if nums.isEmpty {
            return nil
        }
        let head: ListNode? = ListNode(0)
        var prev: ListNode? = head
        var posNode: ListNode?
        var buildCount = 0
        
        for num in nums {
            prev?.next = ListNode(num)
            if buildCount == pos {
                posNode = prev?.next
            }
            prev = prev?.next
            buildCount += 1
        }
        prev?.next = posNode
        return head?.next
    }
    
    func arrayWith(list head: ListNode?) -> [Int] {
        if head == nil {
            return []
        }
        var nums: [Int] = []
        var prev = head
        while prev != nil {
            nums.append(prev!.val)
            prev = prev?.next
        }
        return nums
    }
    
    
}
