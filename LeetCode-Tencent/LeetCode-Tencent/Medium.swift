//
//  medium.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

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
