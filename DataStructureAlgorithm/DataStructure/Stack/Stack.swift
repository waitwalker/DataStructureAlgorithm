

//
//  Stack.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/11.
//  Copyright © 2019 waitwalker. All rights reserved.
//
/***
    栈
 **/

import UIKit

// MARK: - 栈的链表实现
class Stack<T:Equatable> {
    
    private(set) var nodeList:NodeList<T>?
    
    // 是否为空
    var isEmpty:Bool {
        get {
            return nodeList == nil ? true : false
        }
    }
    
    // MARK: - 构造方法
    init() {
    }
    
    
    /// 压栈操作
    ///
    /// - Parameter element: 压栈元素
    func push(element:T) -> Void {
        if let node = nodeList {
            let nodeLength = node.traverse(with: node)
            let newNode = NodeList(val: element)
            let lastNode = node.find(with: node, at: nodeLength - 1)
            lastNode?.next = newNode
        } else {
            nodeList = NodeList(val: element)
        }
    }
    
    /// 获取栈顶元素
    ///
    /// - Returns: 栈顶元素
    func top() -> T? {
        guard let nodeL = nodeList else { return nil }
        let nodeLength = nodeL.traverse(with: nodeL)
        if nodeLength > 1 {
            return nodeL.find(with: nodeL, at: nodeLength - 1)?.value
        } else {
            return nodeL.value
        }
    }
    
    
    /// pop 移除栈顶元素
    func pop() -> Void {
        guard let nodeL = nodeList else { return }
        let nodeLength = nodeL.traverse(with: nodeL)
        if nodeLength > 1 {
            nodeList = nodeList?.delete(with: nodeList, index: nodeLength - 1)
        } else {
            nodeList = nil
        }
    }
}

// MARK: - 栈的数组实现
struct StackA<T> {
    
    private(set) var elements:[T] = []
    
    /// isEmpty
    var isEmpty:Bool{
        get {
            return elements.count == 0 ? true : false
        }
    }
    
    /// top
    var top:T? {
        get {
            return elements.count > 0 ? elements.last : nil
        }
    }
    
    
    // MARK: - 构造函数
    init() {
        
    }
    
    
    /// push压栈操作
    ///
    /// - Parameter element: 压栈元素
    mutating func push(element:T) -> Void {
        elements.append(element)
    }
    
    
    /// pop出栈操作
    mutating func pop() -> Void {
        guard elements.count > 0 else {
            return
        }
        elements.removeLast()
    }
}

