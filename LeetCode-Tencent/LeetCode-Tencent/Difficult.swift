//
//  difficult.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

/// 23. 合并K个升序链表
/*
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
  

 提示：

 k == lists.length
 0 <= k <= 10^4
 0 <= lists[i].length <= 500
 -10^4 <= lists[i][j] <= 10^4
 lists[i] 按 升序 排列
 lists[i].length 的总和不超过 10^4

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/merge-k-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_23 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    /// 字典排序法
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var result: ListNode?
        var dic = [Int: Int]()
        var cur: ListNode?
        
        //1
        for node in lists {
            cur = node
            while cur != nil {
                dic.updateValue((dic[cur!.val] ?? 0) + 1, forKey: cur!.val)
                cur = cur!.next
            }
        }
        
        //2.
        for key in dic.keys.sorted() {
            for _ in 0..<dic[key]! {
                if result == nil {
                    result = ListNode.init(key)
                    cur = result
                    continue
                }
                
                cur!.next = ListNode.init(key)
                cur = cur!.next
            }
        }
        return result
    }

    /// 解题思路
    /// 与合并两个链表类似，
    /// 这次一次性合并 n 个链表，则需要 n 个下标指针
    /// 时间复杂度 O(n*m)  m 为链表条数，n 为总节点数
    /// 空间复杂度 O(m), m 为链表条数
    func mergeKLists11(_ lists: [ListNode?]) -> ListNode? {
        var prevs: [ListNode?] = lists
        let head = ListNode()
        var hPrev:ListNode? = head
        var minNode: ListNode
        var minIndex: Int = 0
        while !prevs.isEmpty {
            if prevs[0] == nil {
                prevs.removeFirst()
                continue
            }
            minNode = prevs[0]!
            minIndex = 0
            for case let (i, prev?) in prevs.enumerated() {
                if prev.val < minNode.val {
                    minNode = prev
                    minIndex = i
                }
            }
            prevs[minIndex] = prevs[minIndex]?.next
            hPrev?.next = minNode
            hPrev = hPrev?.next
        }
        return head.next
    }
    
    /// 数组创建链表
    /// - Parameters:
    ///   - nums: 数组
    ///   - pos: 环点的位置， -1 则无环
    /// - Returns: head
    func buildListWith(nums: [[Int]]) -> [ListNode?] {
        if nums.isEmpty {
            return [nil]
        }
        func build(_ nums: [Int]) -> ListNode? {
            if nums.isEmpty {
                return nil
            }
            let head: ListNode? = ListNode(0)
            var prev: ListNode? = head
            for num in nums {
                prev?.next = ListNode(num)
                prev = prev?.next
            }
            return head?.next
        }
        
        let heads = nums.map { build($0) }
        return heads
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
