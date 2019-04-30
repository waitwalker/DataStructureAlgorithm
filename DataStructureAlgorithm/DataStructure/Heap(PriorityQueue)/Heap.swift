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
    init() {
        
    }
    
    
    /// 左子树索引
    ///
    /// - Parameter index: 当前节点索引
    /// - Returns: 左子树的索引
    func leftChildIndex(index:Int) -> Int {
        guard elements.count > 0 else {
            return 0
        }
        return (2 * index + 1) < (elements.count - 1) ? (2 * index + 1) : 0
    }
    
    
    /// 右子树索引
    ///
    /// - Parameter index: 当前节点索引
    /// - Returns: 右子树的索引
    func rightChildIndex(index:Int) -> Int {
        guard elements.count > 0 else {
            return 0
        }
        return (2 * index + 2) < (elements.count - 1) ? (2 * index + 2) : 0
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
        2)将新元素节点与其父节点进行比较,如果优先级大于父节点(也就是其值大于父节点),则新节点与父节点进行位置更换,继续新节点与父节点进行比较
        3)递归
     */
    /// 插入操作
    ///
    /// - Parameter element: 待插入的元素
    func insert(element:T) -> Void {
        elements.append(element)
        guard elements.count > 1 else {
            return
        }
        shiftUp(index: elements.count - 1)
    }
    
    
    /// 上滤
    ///
    /// - Parameter index: 当前索引
    func shiftUp(index:Int) -> Void {
        let parentIndex = self.parentIndex(index: index)
        guard isHigherPriority(firstIndex: index, secondIndex: parentIndex) else {
            return
        }
        swapElement(with: index, and: parentIndex)
        
        // 向上继续比较
        shiftUp(index: parentIndex)
    }
    
    
    /// 最大堆判断优先级    
    ///
    /// - Parameters:
    ///   - firstIndex: 新元素索引
    ///   - secondIndex: 父节点索引
    /// - Returns: 新节点是否具有优先级
    private func isHigherPriority(firstIndex:Int, secondIndex:Int) -> Bool {
        guard firstIndex < elements.count && secondIndex < elements.count  else {
            return false
        }
        return elements[firstIndex] > elements[secondIndex]
    }
    
    
    /// 交换两个元素  
    ///
    /// - Parameters:
    ///   - firstIndex: 第一个元素索引
    ///   - secondIndex: 第二个元素索引
    private func swapElement(with firstIndex:Int, and secondIndex:Int) -> Void {
        guard firstIndex < elements.count && secondIndex < elements.count else {
            return
        }
        elements.swapAt(firstIndex, secondIndex)
    }
}
