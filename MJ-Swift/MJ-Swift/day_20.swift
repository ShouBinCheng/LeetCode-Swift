//
//  day_20.swift
//  MJ-Swift
//
//  Created by 程守斌 on 2023/2/23.
//

import Foundation
import Curry

infix operator >>> : AdditionPrecedence
func >>> <A, B, C>(_ f1: @escaping (A) -> B,
                  _ f2: @escaping (B) -> C)
    -> (A) -> C { { f2(f1($0)) } }

func day_20(){
    
//    let num = 1
//    func add(_ v: Int) -> (Int) -> Int { { $0 + v } }
//    func sub(_ v: Int) -> (Int) -> Int { { $0 - v } }
//    func multiple(_ v: Int) -> (Int) -> Int { { $0 * v } }
//    func divide(_ v: Int) -> (Int) -> Int { { $0 / v } }
//    func mod(_ v: Int) -> (Int) -> Int { { $0 % v } }
//
//    let fn = add(3) >>> multiple(5) >>> sub(1) >>> mod(10) >>> divide(2)
//    print(fn(num))
    
    
    /// 柯里化（Currying）练习
    func add2(_ v1: Int, _ v2: Int, _ v3: Int) -> Int { v1 + v2 + v3 }
//    func add2(_ v1:Int) -> (Int) -> (Int) -> Int {
//        return { v2 in
//            return { v3 in
//                v1 - v2 - v3
//            }
//        }
//    }
    
    let curryAdd2 = curry(add2)
    // 调用柯里化后的函数
    let result = curryAdd2(1)(2)(3)
    print(result) // 输出 6
//    print(add2(100)(20)(30))

//    let arr = [2]
//    let _ = arr.map {$0}
    
    
    var vm = TradeViewModel()
    vm.setCounterId { "007" }
      .setName { "name hello" }
      .showLog()
}


class TradeViewModel {
    
    private var counter_id: String?
    private var name: String?
    private var quote: Int?
    private var price: Int?
    
    @discardableResult
    func setCounterId(_ fu: () -> String?) -> Self {
        self.counter_id = fu()
        return self
    }
    
    @discardableResult
    func setName(_ fu: () -> String?) -> Self {
        self.name = fu()
        return self
    }
    
    func showLog() {
        print(counter_id as Any, name as Any)
    }
}
