//
//  SimpleTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class SimpleTestting: XCTestCase {
    
    /// 292. Nim 游戏
    func testSolution_292() {
        let solution = Solution_292()
        
        do {
            let nums = [4,8,12,3,6,9]
            let results = [false,false,false,true,true,true]
            let res = nums.map { solution.canWinNim($0) }
            XCTAssert(res == results)
        }
        
    }
    
    /// 231. 2 的幂
    func testSolution_231() {
        let solution = Solution_231()
        do {
            let n = 16
            let result = true
            let res = solution.isPowerOfTwo(n)
            XCTAssert(res == result)
        }
    }
    
    /// 217. 存在重复元素
    func testSolution_217() {
        let solution = Solution_217()
        do {
            let nums = [1,2,3,1]
            let result = true
            let res = solution.containsDuplicate(nums)
            XCTAssert(res == result)
        }
    }
    
    /// 206. 反转链表
    func testSolution_206() {
        let solution = Solution_206()
        do {
            let nums = [1,2,3,4,5]
            let result = [5,4,3,2,1]
            let list = solution.buildListWith(nums: nums, pos: -1)
            let newList = solution.reverseList(list)
            let res = solution.arrayWith(list: newList)
            XCTAssert(res == result)
        }
        
        do {
            let nums: [Int] = []
            let result: [Int] = []
            let list = solution.buildListWith(nums: nums, pos: -1)
            let newList = solution.reverseList(list)
            let res = solution.arrayWith(list: newList)
            XCTAssert(res == result)
        }
    }
    
    ///557. 反转字符串中的单词 III
    func testSolution_557() {
        let solution = Solution_557()
        
        do {
            let str = "God Ding"
            let result = "doG gniD"
            let res = solution.reverseWords(str)
            XCTAssert(res == result)
        }
        
        do {
            let str = "Let's take LeetCode contest"
            let result = "s'teL ekat edoCteeL tsetnoc"
            let res = solution.reverseWords(str)
            XCTAssert(res == result)
        }
        
    }
    
    /// 169. 多数元素
    func testSolution_169() {
        let solution = Solution_169()
        
        do {
            let nums = [3,2,3]
            let result = 3
            let res = solution.majorityElement(nums)
            XCTAssert(res == result)
        }
        
        do {
            let nums = [3,3,3,3,1,2,4,5]
            let result = 3
            let res = solution.majorityElement(nums)
            XCTAssert(res == result)
        }
        
    }
    
    
    /// 141. 环形链表
    func testSolution_141() {
        let solution = Solution_141()
        
        do {
            let head = [3,2,0,-4], pos = 1
            let result = true
            let res = solution.hasCycle(solution.buildListWith(nums: head, pos: pos))
            XCTAssert(result == res)
        }
        ///...
    }
    
    /// 136. 只出现一次的数字
    func testSolution_136() {
        let solution = Solution_136()
        
        do {
            let nums = [4,1,2,1,2]
            let result = 4
            let res = solution.singleNumber(nums)
            XCTAssert(res == result)
        }
    }
    
    
    /// 121. 买卖股票的最佳时机
    func testSolution_121() {
        let solution = Solution_121()
        do {
            let prices = [7,1,5,3,6,4]
            let result = 5
            let res = solution.maxProfit(prices)
            XCTAssert(result == res)
        }
    }
    
    
    /// 104. 二叉树的最大深度
    func testSolution_104() {
        let solution = Solution_104()
        
        do {
            let nums = [3,9,20,nil,nil,15,7]
            let result = 3
            let root = solution.createTreeWith(array: nums)
            XCTAssert(result == solution.maxDepth(root))
        }
    }
    
    /// 88. 合并两个有序数组
    func testSolution_88() {
        let solution = Solution_88()
        
        do {
            var nums1 = [1,2,4,5,6,0], m = 5, nums2 = [3], n = 1
            let result = [1,2,3,4,5,6]
            solution.merge(&nums1, m, nums2, n)
            XCTAssert(result == nums1)
            print("pass 0")
        }
        
        do {
            var nums1 = [4,5,6,0,0,0], m = 3, nums2 = [1,2,3], n = 3
            let result = [1,2,3,4,5,6]
            solution.merge(&nums1, m, nums2, n)
            XCTAssert(result == nums1)
            print("pass 1")
        }
        
        do {
            var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
            let result = [1,2,2,3,5,6]
            solution.merge(&nums1, m, nums2, n)
            XCTAssert(result == nums1)
            print("pass 2")
        }
        
        do {
            var nums1 = [1], m = 1, nums2: [Int] = [], n = 0
            let result = [1]
            solution.merge(&nums1, m, nums2, n)
            XCTAssert(result == nums1)
            print("pass 3")
        }
        
        do {
            var nums1 = [0], m = 0, nums2 = [1], n = 1
            let result = [1]
            solution.merge(&nums1, m, nums2, n)
            XCTAssert(result == nums1)
            print("pass 4")
        }
    }
    
    /// 70. 爬楼梯
    func testSolution_70() {
        let ks = [1,2,3,4,5,45]
        let results = [1,2,3,5,8,1836311903]
        let solution = Solution_70()
        
        for i in 0..<ks.count {
            let result = solution.climbStairs(ks[i])
            XCTAssert(result == results[i])
        }
    }
    
    /// 21. 合并两个有序链表
    func testSolution_21() {
        let solution = Solution_21()
        do {
            let l1 = [1,2,4]
            let l2 = [1,3,4]
            let result = [1,1,2,3,4,4]
            let head = solution.mergeTwoLists(solution.arrayToList(l1),
                                                        solution.arrayToList(l2))
            let solutionResult = solution.listToArray(head)
            XCTAssert(result == solutionResult)
        }
        
        do {
            let l1: [Int] = []
            let l2: [Int] = []
            let result: [Int] = []
            let head = solution.mergeTwoLists(solution.arrayToList(l1),
                                                        solution.arrayToList(l2))
            let solutionResult = solution.listToArray(head)
            XCTAssert(result == solutionResult)
        }
        
        do {
            let l1: [Int] = []
            let l2: [Int] = [0]
            let result: [Int] = [0]
            let head = solution.mergeTwoLists(solution.arrayToList(l1),
                                                        solution.arrayToList(l2))
            let solutionResult = solution.listToArray(head)
            XCTAssert(result == solutionResult)
        }
    }
    
    
    /// 20. 有效的括号
    func testSolution_20() {
        let strs = ["()", "()[]{}","(]"]
        let results = [true, true, false]
        let solution = Solution_20()
        for i in 0..<strs.count {
            print(i)
            XCTAssert(results[i] == solution.isValid(strs[i]))
        }
    }
    
    /// 14. 最长公共前缀
    func testSolution_14() {
        let strs = ["flower","flow","flight"]
        let result = "fl"
        let returnResult = Solution_14().longestCommonPrefix(strs)
        XCTAssert(result == returnResult)
    }

    /// 9. 回文数 测试用例
    func testSolution_9() {
        let xArray = [10,101,123,123454321]
        let resultArray = [false,true,false,true]
        let solution = Solution_9()
        for i in 0..<xArray.count {
            let isPalindrome = solution.isPalindrome(xArray[i])
            XCTAssert(isPalindrome == resultArray[i])
        }
    }

}
