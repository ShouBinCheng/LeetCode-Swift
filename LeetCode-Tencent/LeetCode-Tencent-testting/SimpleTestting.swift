//
//  SimpleTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class SimpleTestting: XCTestCase {
    
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
