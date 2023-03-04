//
//  Medium.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class MediumTestting: XCTestCase {

    /// 237. 删除链表中的节点
    func testSolution_237() {
        let solution = Solution_237()
        
        do {
            let nums = [4,5,1,9], node = 5
            let result = [4,1,9]
            var deleteNode: Solution_237.ListNode?
            let head = solution.buildListWith(nums: nums, pos: node, &deleteNode)
            solution.deleteNode(deleteNode)
            let res = solution.arrayWith(list: head)
            XCTAssert(res == result)
        }
        
        do {
            let nums = [4,5,1,9], node = 1
            let result = [4,5,9]
            var deleteNode: Solution_237.ListNode?
            let head = solution.buildListWith(nums: nums, pos: node, &deleteNode)
            solution.deleteNode(deleteNode)
            let res = solution.arrayWith(list: head)
            XCTAssert(res == result)
        }
    }
    
    /// 236. 二叉树的最近公共祖先
    func testSolution_236() {
        let solution = Solution_236()
        
        do {
            let nums = [3,5,1,6,2,0,8,nil,nil,7,4]
            let p = 5, q = 4
            let result = 5
            var pNode: Solution_236.TreeNode?
            var qNode: Solution_236.TreeNode?
            let root = solution.createTreeWith(array: nums, p: p, pNode: &pNode, q: q, qNode: &qNode)
            let resNode = solution.lowestCommonAncestor(root, pNode, qNode)
            let res = resNode?.val ?? 0
            XCTAssert(res == result)
        }
        
        do {
            let nums = [3,5,1,6,2,0,8,nil,nil,7,4]
            let p = 5, q = 1
            let result = 3
            var pNode: Solution_236.TreeNode?
            var qNode: Solution_236.TreeNode?
            let root = solution.createTreeWith(array: nums, p: p, pNode: &pNode, q: q, qNode: &qNode)
            let resNode = solution.lowestCommonAncestor(root, pNode, qNode)
            let res = resNode?.val ?? 0
            XCTAssert(res == result)
        }
        
    }
    
    /// 235. 二叉搜索树的最近公共祖先
    func testSolution_235() {
        let solution = Solution_235()
        
        do {
            let nums = [6,2,8,0,4,7,9,nil,nil,3,5]
            let p = 2, q = 8
            let result = 6
            var pNode: Solution_235.TreeNode?
            var qNode: Solution_235.TreeNode?
            let root = solution.createTreeWith(array: nums, p: p, pNode: &pNode, q: q, qNode: &qNode)
            let resNode = solution.lowestCommonAncestor(root, pNode, qNode)
            let res = resNode?.val ?? 0
            XCTAssert(res == result)
        }
        
        
        do {
            let nums = [6,2,8,0,4,7,9,nil,nil,3,5]
            let p = 2, q = 4
            let result = 2
            var pNode: Solution_235.TreeNode?
            var qNode: Solution_235.TreeNode?
            let root = solution.createTreeWith(array: nums, p: p, pNode: &pNode, q: q, qNode: &qNode)
            let resNode = solution.lowestCommonAncestor(root, pNode, qNode)
            let res = resNode?.val ?? 0
            XCTAssert(res == result)
        }
    }
    
    /// 230. 二叉搜索树中第K小的元素
    func testSolution_230() {
        let solution = Solution_230()
        
        do {
            let root = [3,1,4,nil,2], k = 1
            let reslut = 1
            let tree = solution.createTreeWith(array: root)
            let res = solution.kthSmallest(tree, k)
            XCTAssert(res == reslut)
        }
        
        do {
            let root = [5,3,6,2,4,nil,nil,1], k = 3
            let reslut = 3
            let tree = solution.createTreeWith(array: root)
            let res = solution.kthSmallest(tree, k)
            XCTAssert(res == reslut)
        }
    }
    
    /// 5. 最长回文子串
    func testSoluton_5() {
        let solution = Solution_5()
        
        do {
            let str = "eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"
            let result = str
            let res = solution.longestPalindrome(str)
            XCTAssert(res == result)
        }
        
        do {
            let str = "babad"
            let result = "bab"
            let res = solution.longestPalindrome(str)
            XCTAssert(res == result)
        }
    }
    
    /// 2. 两数相加
    func testSolution_2() {
        let solution = Solution_2()
        
        do {
            let nums1 = [2,4,3]
            let nums2 = [5,6,4]
            let result = [7,0,8]
            let l1 = solution.buildListWith(nums: nums1, pos: -1)
            let l2 = solution.buildListWith(nums: nums2, pos: -1)
            let sumList = solution.addTwoNumbers(l1, l2)
            let res = solution.arrayWith(list: sumList)
            XCTAssert(res == result)
        }
        
        do {
            let nums1 = [0]
            let nums2 = [0]
            let result = [0]
            let l1 = solution.buildListWith(nums: nums1, pos: -1)
            let l2 = solution.buildListWith(nums: nums2, pos: -1)
            let sumList = solution.addTwoNumbers(l1, l2)
            let res = solution.arrayWith(list: sumList)
            XCTAssert(res == result)
        }
        
        do {
            let nums1 = [9,9,9,9,9,9,9]
            let nums2 = [9,9,9,9]
            let result = [8,9,9,9,0,0,0,1]
            let l1 = solution.buildListWith(nums: nums1, pos: -1)
            let l2 = solution.buildListWith(nums: nums2, pos: -1)
            let sumList = solution.addTwoNumbers(l1, l2)
            let res = solution.arrayWith(list: sumList)
            XCTAssert(res == result)
        }
    }

}
