//
//  Queue.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/11.
//  Copyright © 2019 waitwalker. All rights reserved.
//

/***
    队列
 **/


import UIKit

// MARK: - 队列
struct Queue<T> {
    private(set) var elements:[T] = []
    
    // 队列元素个数
    var count:Int {
        get{
            return elements.count
        }
    }
    
    // MARK: - 构造函数
    init() {
    }
    
    
    /// enqueue操作
    ///
    /// - Parameter element: 入队元素
    mutating func enqueue(element:T) -> Void {
        elements.append(element)
    }
    
    /// dequeue操作
    mutating func dequeue() -> Void {
        guard elements.count > 0 else {
            return
        }
        elements.removeFirst()
    }
}
