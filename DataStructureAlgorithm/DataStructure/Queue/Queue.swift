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
    
    // MARK: - 构造函数
    init() {
    }
    
    mutating func enqueue(element:T) -> Void {
        elements.append(element)
    }
}
