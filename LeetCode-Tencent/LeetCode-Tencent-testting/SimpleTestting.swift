//
//  SimpleTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class SimpleTestting: XCTestCase {
    
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
