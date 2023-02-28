//
//  SimpleTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class SimpleTestting: XCTestCase {
    
    /// 20. 有效的括号
    func testSolution_20(){
        let strs = ["()", "()[]{}","(]"]
        let results = [true, true, false]
        let solution = Solution_20()
        for i in 0..<strs.count {
            print(i)
            XCTAssert(results[i] == solution.isValid(strs[i]))
        }
    }
    
    /// 14. 最长公共前缀
    func testSolution_14(){
        let strs = ["flower","flow","flight"]
        let result = "fl"
        let returnResult = Solution_14().longestCommonPrefix(strs)
        XCTAssert(result == returnResult)
    }

    /// 9. 回文数 测试用例
    func testSolution_9() throws {
        let xArray = [10,101,123,123454321]
        let resultArray = [false,true,false,true]
        let solution = Solution_9()
        for i in 0..<xArray.count {
            let isPalindrome = solution.isPalindrome(xArray[i])
            XCTAssert(isPalindrome == resultArray[i])
        }
    }

}
