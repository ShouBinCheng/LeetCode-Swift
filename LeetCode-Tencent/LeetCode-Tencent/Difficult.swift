//
//  difficult.swift
//  LeetCode-Tencent
//
//  Created by 程守斌 on 2023/2/28.
//

import Foundation

//MARK: - 124. 二叉树中的最大路径和
/*
 路径 被定义为一条从树中任意节点出发，沿父节点-子节点连接，达到任意节点的序列。同一个节点在一条路径序列中 至多出现一次 。该路径 至少包含一个 节点，且不一定经过根节点。

 路径和 是路径中各节点值的总和。

 给你一个二叉树的根节点 root ，返回其 最大路径和 。

 示例 1：

 输入：root = [1,2,3]
 输出：6
 解释：最优路径是 2 -> 1 -> 3 ，路径和为 2 + 1 + 3 = 6
 示例 2：


 输入：root = [-10,9,20,null,null,15,7]
 输出：42
 解释：最优路径是 15 -> 20 -> 7 ，路径和为 15 + 20 + 7 = 42

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/binary-tree-maximum-path-sum
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_124 {

    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    /// 解题思路，深度优先搜索（递归法）
    /// 递归可计算出每个节点的最大路径和 = cur.val + left.val + right.val
    /// 记录下最大的路径值
    /// - 时间复杂度 O(n)
    /// - 空间复杂度 O(len)，len为数的深度，简化 O(n)
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        dfs(root, result: &result)
        return result
    }
    
    @discardableResult
    func dfs(_ root: TreeNode?, result: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        let leftSum = dfs(root.left, result: &result)
        let rightSum = dfs(root.right, result: &result)
        let curentNodeSum = leftSum + root.val + rightSum
        result = max(result, curentNodeSum)
        return curentNodeSum
    }
    
    /// 数组转树
    /// 特点是，左节点永远指向 2*i + 1， 有节点指向 2*i+2
    /// 遍历完数组就可以生成树
    func createTreeWith(array: [Int?]) -> TreeNode? {
        if array.first == nil {
            return nil
        }
        let nodes = array.map { n in
            if let num = n {
                return Optional(TreeNode(num))
            } else {
                return nil
            }
        }
        
        for i in 0..<nodes.count {
            if let node = nodes[i] {
                let leftIndex = 2*i + 1
                let rightIndex = 2*i + 2
                if leftIndex < nodes.count {
                    node.left = nodes[leftIndex]
                }
                if rightIndex < nodes.count {
                    node.right = nodes[rightIndex]
                }
            }
        }
        return nodes[0]
    }
}


//MARK: - *** 4. 寻找两个正序数组的中位数
/*
 给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。

 算法的时间复杂度应该为 O(log (m+n)) 。

 示例 1：

 输入：nums1 = [1,3], nums2 = [2]
 输出：2.00000
 解释：合并数组 = [1,2,3] ，中位数 2
 示例 2：

 输入：nums1 = [1,2], nums2 = [3,4]
 输出：2.50000
 解释：合并数组 = [1,2,3,4] ，中位数 (2 + 3) / 2 = 2.5
  
 提示：

 nums1.length == m
 nums2.length == n
 0 <= m <= 1000
 0 <= n <= 1000
 1 <= m + n <= 2000
 -106 <= nums1[i], nums2[i] <= 106

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class Solution_4 {
    
    /// 最优解：待研究
    //TODO: 待研究
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var i = 0
        var j = 0
        let totalCount = (nums1.count + nums2.count)/2
        var midLeft = 0   // 中位数左边
        var midRight = 0  // 中位数右边
        
        while i+j <= totalCount {
            midLeft = midRight;
            
            // 谁小谁先向右移动
            if (j >= nums2.count) || (i < nums1.count && nums1[i] <= nums2[j]) {
                midRight = nums1[i]
                i+=1
            } else  {
                midRight = nums2[j]
                j+=1
            }
        }
        
        if (nums1.count + nums2.count) % 2 == 0 {
            return Double(midLeft + midRight) / 2.0
        } else {
            return Double(midRight);
        }
    }
    
    /// 解题思路
    /// 首先是两个有序数组，找出中文数，中位数如果 （m+n）是奇数的话，就是两数组合并后的中间那个数，偶数的话则是中间两个数和的一半
    /// 题目要求时间复杂度在 O(log (m+n) 之内，因此不能先合并两个数组在进行中位数查找。
    /// 应该先找出符合中位数在两个有序数组的位置的一些规律。
    /// 先将中位数问题转换为第 k 个小数问题
    /// 如果len(n+m)为奇数，k 应该等于 (m+n+1)/2
    /// 如果len(n+m)为偶数，k 应该等于 ((m+n)/2 + ((m+n)/2+1)) /2
    /// 这里可先将 k 取值为 (m+n+1)/2 ，如果len(m+n)为奇数第 k 个值就是中位数
    /// 如果为len(m+n)为偶数的话，第 k 个值为 左边数，右边数为 k + 1位的数
    /// 因为要求时间复杂度需在 O(log (m+n)) 之内，
    /// 对应数组遍历来说符合 O(log (m+n)) 的算法应该是需要结合二分查找
    /// 这里将 k 二分查找的初始值，看将 k 放到两个有序数组中会符合什么样的规律
    /// k 的二分查找第一是先排除 k/2 个数的情况
    /// - 时间复杂度为 O(log (n+m))
    /// - 由于是尾随递归，空间复杂度为 O(1)
    func findMedianSortedArrays11(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count
        let m = nums2.count
        let left = (n+m+1)/2
        let right = (n+m+2)/2
        let num1 = getKth(nums1: nums1, start1: 0, end1: n-1,
                        nums2: nums2, start2: 0, end2: m-1,
                          k: left)
        let num2 = getKth(nums1: nums1, start1: 0, end1: n-1,
                          nums2: nums2, start2: 0, end2: m-1,
                            k: right)
        return Double((num1 + num2)) * 0.5
    }
    
    func getKth(nums1: [Int], start1: Int, end1: Int,
              nums2: [Int], start2: Int, end2: Int,
                 k: Int) -> Int {
        let len1 = end1 - start1 + 1
        let len2 = end2 - start2 + 1
        // 让 len1 的长度小于 len2 ，这样就能保证如果有数组空了，一定是 len1
        if len1 > len2 {
            return getKth(nums1: nums2, start1: start2, end1: end2, nums2: nums1, start2: start1, end2: end1, k: k)
        }
        if len1 == 0 {
            return nums2[start2 + k - 1]
        }
        if k == 1 {
            return min(nums1[start1], nums2[start2])
        }
        let i = start1 + min(len1, k/2) - 1
        let j = start2 + min(len2, k/2) - 1
        if nums1[i] > nums2[j] {
            return getKth(nums1: nums1, start1: start1, end1: end1, nums2: nums2, start2: j+1, end2: end2, k: k-(j-start2+1))
        } else {
            return getKth(nums1: nums1, start1: i+1, end1: end1, nums2: nums2, start2: start2, end2: end2, k: k-(i-start1+1))
        }
    }

}

//MARK: - 23. 合并K个升序链表
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
