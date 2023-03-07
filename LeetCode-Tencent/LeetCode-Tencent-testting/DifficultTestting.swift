//
//  DifficultTestting.swift
//  LeetCode-Tencent-testting
//
//  Created by 程守斌 on 2023/2/28.
//

import XCTest

final class DifficultTestting: XCTestCase {

    /// 4. 寻找两个正序数组的中位数
    func testSolution_4() {
        let solution = Solution_4()
        
        do {
            let nums1 = [1,3], nums2 = [2]
            let result = 2.0
            let ans = solution.findMedianSortedArrays(nums1, nums2)
            XCTAssert(result == ans)
        }

    }
    
    /// 23. 合并K个升序链表
    func testSolution_23() {
        let solution = Solution_23()
        
        do {
            let nums = [[1,4,5],[1,3,4],[2,6]]
            let result = [1,1,2,3,4,4,5,6]
            let lists = solution.buildListWith(nums: nums)
            let merge = solution.mergeKLists(lists)
            let res = solution.arrayWith(list: merge)
            XCTAssert(res == result)
        }
        
        do {
            let nums: [[Int]] = [[]]
            let result: [Int] = []
            let lists = solution.buildListWith(nums: nums)
            let merge = solution.mergeKLists(lists)
            let res = solution.arrayWith(list: merge)
            XCTAssert(res == result)
        }
        
        do {
            let nums: [[Int]] = []
            let result: [Int] = []
            let lists = solution.buildListWith(nums: nums)
            let merge = solution.mergeKLists(lists)
            let res = solution.arrayWith(list: merge)
            XCTAssert(res == result)
        }
        
        do {
            let nums: [[Int]] = [[],[1]]
            let result: [Int] = [1]
            let lists = solution.buildListWith(nums: nums)
            let merge = solution.mergeKLists(lists)
            let res = solution.arrayWith(list: merge)
            XCTAssert(res == result)
        }
    }
}
