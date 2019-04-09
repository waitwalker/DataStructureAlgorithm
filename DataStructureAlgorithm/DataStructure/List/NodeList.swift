//
//  NodeList.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/9.
//  Copyright © 2019 waitwalker. All rights reserved.
//

import UIKit

class NodeList<T:Equatable> {
    
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
    
    
    // MARK: - 遍历链表
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
    
    
    /// 根据指定索引查找某个链表节点的值
    ///
    /// - Parameters:
    ///   - nodeList: 链表
    ///   - index: 要查询的节点
    /// - Returns: 某个索引节点的值
    func find(with nodeList:NodeList?, index:Int) -> T? {
        var tmpNode = nodeList
        var currentIndex:Int = 0
        while tmpNode != nil {
            if currentIndex == index {
                return tmpNode?.value
            }
            currentIndex += 1
            tmpNode = tmpNode?.next
        }
        return nil
    }
    
    /// 根据指定值查找某个链表节点的所有
    ///
    /// - Parameters:
    ///   - nodeList: 链表
    ///   - value: 值
    /// - Returns: 值对应节点的索引
    func find(with nodeList:NodeList?, value:T?) -> Int? {
        var tmpNode = nodeList
        var currentIndex:Int = 0
        while tmpNode != nil {
            if tmpNode?.value == value {
                return currentIndex
            }
            currentIndex += 1
            tmpNode = tmpNode?.next
        }
        return nil
    }

}

// MARK: - 输出链表
extension NodeList:CustomStringConvertible {
    var description: String {
        guard let newNext = next else { return "\(value)" }
        return "\(value) -> \(String(describing:newNext))"
    }
}

extension NodeList:Equatable {
    static func == (lhs: NodeList<T>, rhs: NodeList<T>) -> Bool {
        return lhs.value == rhs.value
    }   
}



