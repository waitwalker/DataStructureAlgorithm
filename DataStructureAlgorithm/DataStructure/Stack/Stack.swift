

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

class Stack<T:Equatable> {
    
    var nodeList:NodeList<T>?
    
    // MARK: - 构造方法
    init() {
    }
    
    // 是否为空
    var isEmpty:Bool {
        get {
            return nodeList == nil ? true : false
        }
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
}
