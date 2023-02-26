//
//  main.swift
//  LeetCode-Sort
//
//  Created by 程守斌 on 2023/2/26.
//

import Foundation

print("Hello, World!")

/*
    排序算法是计算机科学中经典的问题之一。它的目的是将一组数据按照指定的顺序进行排序。
 */

/*
    冒泡排序是最基本的排序算法之一，它的基本思想是将相邻的元素两两比较，将较大的元素向后移动。时间复杂度为 O(n^2)，空间复杂度 O(1)。
     - 最优情况：输入数组已经按照从小到大的顺序排好了，此时时间复杂度为O(n)。
     - 最坏情况：输入数组按照从大到小的顺序排列，此时时间复杂度为O(n^2)。
 */
func bubbleSort(_ array: inout [Int]) {
    guard array.count > 1 else {
        return
    }
    for i in 0 ..< array.count {
        for j in 1 ..< array.count-i {
            if array[j-1] > array[j] {
                array.swapAt(j-1, j)
            }
        }
    }
    
}


/*
    选择排序是一种简单直观的排序算法，它的基本思想是每次从未排序的数组中选择最小的元素，然后将其放到已排序的数组的末尾。时间复杂度为 O(n^2)，空间复杂度为 O(1)。
     - 最优情况和最坏情况的时间复杂度均为O(n^2)。
 */
func selectionSort(_ array: inout [Int]) {
    guard array.count > 1 else {
        return
    }
    for i in 0 ..< array.count - 1 {
        var minIndex = i
        for j in i+1 ..< array.count {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if i != minIndex {
            array.swapAt(i, minIndex)
        }
    }
}

/*
    插入排序是一种简单直观的排序算法，它的基本思想是将未排序的元素插入到已排序的数组中。时间复杂度为 O(n^2)，空间复杂度为 O(1)。
     - 最优情况：输入数组已经按照从小到大的顺序排好了，此时时间复杂度为O(n)。
     - 最坏情况：输入数组按照从大到小的顺序排列，此时时间复杂度为O(n^2)。
 */
func insertionSort(_ array: inout [Int]) {
    guard array.count > 1 else {
        return
    }
    for i in 1 ..< array.count {
        var j = i
        let temp = array[i]
        while j > 0 && temp < array[j-1] {
            array[j] = array[j-1]
            j -= 1
        }
        array[j] = temp
    }
}

/*
    快速排序是一种常用的排序算法，它的基本思想是通过一趟排序将待排记录分隔成独立的两个部分，其中一部分记录的关键字均比另一部分记录的关键字小，然后分别对这两部分记录继续进行排序，直到整个序列有序。时间复杂度为 O(nlogn),空间复杂度为 O(logn)。
     - 最优情况：每次分区的中间元素恰好为数组的中位数，此时时间复杂度为O(n log n)。
     - 最坏情况：每次分区的中间元素都是最小或最大的元素，此时时间复杂度为O(n^2)。
 */
func quickSort(_ array: inout [Int], _ left: Int, _ right: Int) {
    guard left < right, 0 <= left, right < array.count else {
        return
    }
    var i = left
    var j = right
    let pivot = array[(left+right)/2]
    while i <= j {
        while array[i] < pivot {
            i += 1
        }
        while array[j] > pivot {
            j -= 1
        }
        if i <= j {
            array.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
    if left < j {
        quickSort(&array, left, j)
    }
    if i < right {
        quickSort(&array, i, right)
    }
}

/*
 归并排序是一种稳定的排序算法，它的基本思想是将待排序的数组分成若干个字序列，每个子序列都是有序的，然后再将子序列合并成一个有序的序列。时间复杂度为 O(nlogn)，空间复杂度为 O(n)。
    - 最优情况和最坏情况的时间复杂度均为O(n log n)。
 */
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    return merge(leftArray, rightArray)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray = [Int]()
    while leftIndex < left.count && rightIndex < right.count {
        if left[leftIndex] < right[rightIndex] {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        } else if left[leftIndex] > right[rightIndex] {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        } else {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
    }
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    return orderedArray
}
