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
    
    
    /// 遍历链表
    ///
    /// - Parameter nodeList: 链表
    /// - Returns: 链表长度
    func traverse(with nodeList:NodeList?) -> Int {
        var nodeListLength:Int = 0
        var tmpNode = nodeList
        while tmpNode != nil {
            nodeListLength += 1
            tmpNode = tmpNode!.next
        }
        return nodeListLength
    }

}

// MARK: - 输出链表
extension NodeList:CustomStringConvertible {
    var description: String {
        guard let newNext = next else { return "\(value)" }
        return "\(value) -> \(String(describing:newNext))"
    }
}
