//
//  day_21.swift
//  MJ-Swift
//
//  Created by 程守斌 on 2023/2/23.
//

import Foundation

struct MJ<Base> {
    var base: Base
    init(_ base: Base) {
        self.base = base
    }
}
protocol MJCompatible {}
extension MJCompatible {
    static var mj: MJ<Self>.Type {
        get {MJ<Self>.self}
        set {}
    }
    
    var mj: MJ<Self> {
        get { MJ(self) }
        set {}
    }
}

/// String
extension String : MJCompatible {}
extension MJ where Base == String {
    var numberCount: Int {
        var count = 0
        for c in base where ("0"..."9").contains(c) {
            count += 1
        }
        return count
    }
    
    static func testString(){
        print("testString")
    }
}

class Person {
    deinit {
        print("Person deinit")
    }
}

extension Person : MJCompatible {}
extension MJ where Base: Person {
    func run(){
        print("dadf")
    }
}



func day_21() {
    
    let str = "123rrr"
    print(str.mj.numberCount)
    print(String.mj.testString())
    
    let person = Person()
    person.mj.run()
    
    func isArray(_ value: Any) -> Bool {
//        let type = Swift.type(of: value)
//        print(Swift.type(of: value))
//        Swift.type(of: value).Ty == NSArray.Type
        return true
    }
    print(isArray([1]))
    print(isArray(["1",1]))
    print(isArray(NSArray()))
    print(isArray(NSMutableArray()))
}



