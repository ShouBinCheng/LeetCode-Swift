//
//  day_19.swift
//  MJ-Swift
//
//  Created by 程守斌 on 2023/2/22.
//

import Foundation

/// 资源管理

/// 资源 Resource Root
enum R {}

extension R {
    enum string: String {
        case add
    }
}



var arr = ["1","2","3","arr"]

//var arr2 = arr.flatMap { Array.init(repeating:$0, count:$0) }
var arr2 = arr.compactMap{ Int($0) }

//arr2
