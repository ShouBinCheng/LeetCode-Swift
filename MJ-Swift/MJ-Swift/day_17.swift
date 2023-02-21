//
//  day_17.swift
//  MJ-Swift
//
//  Created by 程守斌 on 2023/2/21.
//

import Foundation

func day_17() {
    print("Hello day 17")
    
    class Person { }
    var person = Person()
    
    /// 方法1 ：获取堆空间地址
    var ptr = withUnsafePointer(to: &person) { UnsafeRawPointer($0) }
    var personObjectAddress = ptr.load(as: UInt.self)
    var ptr2 = UnsafeRawPointer(bitPattern: personObjectAddress)
    print(ptr2)
    
    /// 方法2 ： 获取堆空间地址
    var ptr3 = unsafeBitCast(person, to: UnsafeRawPointer.self)
    print(ptr3)
    
}
