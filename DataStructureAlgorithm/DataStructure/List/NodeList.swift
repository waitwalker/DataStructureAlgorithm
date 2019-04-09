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
    
    /// 根据指定索引查找某个链表节点
    ///
    /// - Parameters:
    ///   - nodeList: 链表
    ///   - index: 要查询的节点
    /// - Returns: 某个索引节点
    func find(with nodeList:NodeList?, at index:Int) -> NodeList? {
        var tmpNode = nodeList
        var currentIndex:Int = 0
        while tmpNode != nil {
            if currentIndex == index {
                return tmpNode
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
    
    
    /// 在链表指定位置插入新的节点并返回新的链表
    ///
    /// - Parameters:
    ///   - nodeList: 链表
    ///   - node: 待插入节点
    ///   - index: 插入位置
    /// - Returns: 新的链表
    func insert(with nodeList:NodeList?, node:NodeList, index:Int) -> NodeList? {
        guard let nodeL = nodeList else { return node }
        if traverse(with: nodeL) <= index {
            return node
        }
        var previousN:NodeList?
        if index != 0 {
            previousN = nodeL.find(with: nodeL, at: index - 1)
            node.next = previousN!.next
            previousN!.next = node
            return nodeL
        } else {
            node.next = nodeL
            return node
        }
    }
    
    
    /// 删除指定位置的节点并返回新的列表
    ///
    /// - Parameters:
    ///   - nodeList: 链表
    ///   - index: 待删除的位置
    /// - Returns: 删除后的链表
    func delete(with nodeList:NodeList?, index:Int) -> NodeList? {
        guard let nodeL = nodeList else { return nil }
        if nodeL.traverse(with: nodeL) <= index {
            return nodeL
        }
        
        if index == 0 {
            return nodeL.next
        } 
        
        let previousN = nodeL.find(with: nodeL, at: index - 1)
        let currentN = nodeL.find(with: nodeL, at: index)
        previousN?.next = currentN?.next
        return nodeL
    }

}

// MARK: - 输出链表
extension NodeList:CustomStringConvertible {
    var description: String {
        guard let newNext = next else { return "\(value)" }
        return "\(value) -> \(String(describing:newNext))"
    }
}

// MARK: - 判断两个节点是否相等
extension NodeList:Equatable {
    static func == (lhs: NodeList<T>, rhs: NodeList<T>) -> Bool {
        return lhs.value == rhs.value
    }   
}



