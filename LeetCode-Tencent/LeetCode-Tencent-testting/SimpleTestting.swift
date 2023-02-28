//
//  SimpleTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class SimpleTestting: XCTestCase {

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
