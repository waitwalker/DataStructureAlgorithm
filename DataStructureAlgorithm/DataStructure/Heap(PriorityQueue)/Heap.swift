//
//  Heap.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/30.
//  Copyright © 2019 waitwalker. All rights reserved.
//

import UIKit

// MARK: - 堆    
class Heap<T:Comparable> {
    
    // 存储结构
    private(set) var elements:[T] = []
    
    // 比较两个元素的大小 确定优先级
    private let comparedClosure:(T,T) -> Bool
    
    // 是否为空
    var isEmpty:Bool {
        return elements.isEmpty
    }
    
    // 元素个数
    var count:Int {
        return elements.count
    }
    
    // 堆顶元素
    var peak:T? {
        return elements.first
    }
    
    // MARK: - 构造
    init(closure:@escaping (T,T)->Bool) {
        self.comparedClosure = closure
    }
    
    
    /// 左子树索引
    ///
    /// - Parameter index: 当前节点索引
    /// - Returns: 左子树的索引
    func leftChildIndex(index:Int) -> Int {
        return 2 * index + 1
    }
    
    
    /// 右子树索引
    ///
    /// - Parameter index: 当前节点索引
    /// - Returns: 右子树的索引
    func rightChildIndex(index:Int) -> Int {
        return 2 * index + 2
    }
    
    
    /// 父节点索引
    ///
    /// - Parameter index: 当前节点索引
    /// - Returns: 父节点的索引
    func parentIndex(index:Int) -> Int {
        guard index > 0 else {
            return 0
        }
        return (index - 1) / 2
    }
    
    /***
        1)将新元素插入到数组的末尾
        2)将新元素节点与其父节点进行比较
     */
    /// 插入操作
    ///
    /// - Parameter element: 待插入的元素
    func insert(element:T) -> Void {
        elements.append(element)
    }
    
    
}
