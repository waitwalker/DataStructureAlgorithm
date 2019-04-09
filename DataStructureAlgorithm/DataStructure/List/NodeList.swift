//
//  NodeList.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/9.
//  Copyright © 2019 waitwalker. All rights reserved.
//

import UIKit

class NodeList<T> {
    
    
    /// 节点元素的值
    var value:T
    
    /// 节点元素的next指针
    var next:NodeList?
    
    /// 链表节点元素的构造函数
    ///
    /// - Parameter val: 值
    init(val:T) {
        self.value = val
    }

}

// MARK: - 输出链表
extension NodeList:CustomStringConvertible {
    var description: String {
        guard let newNext = next else { return "\(value)" }
        return "\(value) -> \(String(describing:newNext))"
    }
}
