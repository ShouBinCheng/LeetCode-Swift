//
//  LeetCode_SortTesting.swift
//  LeetCode-SortTesting
//
//  Created by 程守斌 on 2023/2/26.
//

import XCTest


final class LeetCode_SortTesting: XCTestCase {
    
    /// 冒泡排序单元测试
    func testBubbleSort() {
        var array = [9,1,8,2,7,3,6,4,5,0]
        let result = [0,1,2,3,4,5,6,7,8,9]
        bubbleSort(&array)
        XCTAssert(array == result)
    }

    /// 选择排序单元测试
    func testSelectionSort() {
        var array = [9,1,8,2,7,3,6,4,5,0]
        let result = [0,1,2,3,4,5,6,7,8,9]
        selectionSort(&array)
        XCTAssert(array == result)
    }
    
    ///  插入排序单元测试
    func testInsertionSort() {
        var array = [9,1,8,2,7,3,6,4,5,0]
        let result = [0,1,2,3,4,5,6,7,8,9]
        insertionSort(&array)
        XCTAssert(array == result)
    }
    
    ///  快速排序单元测试
    func testQuickSort() {
        var array = [9,1,8,2,7,3,6,4,5,0]
        let result = [0,1,2,3,4,5,6,7,8,9]
        quickSort(&array, 0, array.count-1)
        XCTAssert(array == result)
    }
    
    
    /// 归并排序单元测试
    func testMergeSort() {
        let array = [9,1,8,2,7,3,6,4,5,0]
        let result = [0,1,2,3,4,5,6,7,8,9]
        let sortedArray = mergeSort(array)
        XCTAssert(sortedArray == result)
    }
}
