//
//  Medium.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class MediumTestting: XCTestCase {

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
