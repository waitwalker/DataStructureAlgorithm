//
//  BinarySearchTree.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/28.
//  Copyright © 2019 waitwalker. All rights reserved.
//

import UIKit

// MARK: - 二叉查找树
class BinarySearchTree <T:Comparable> {
    
    private(set) var root:BinaryTree<T>?
    
    // MARK: - 构造函数
    init(value: T) {
        self.root = BinaryTree(value: value)
    }
    
    /***
     根节点开始查找,如果根节点的value与待查找的相等,直接返回;
     如果待查找的值大于根节点的值,则在二叉查找树的右子树查找;
     如果待查找的值小于根节点的值,则在二叉查找树的左子树查找.
     递归执行
     */
    /// 查找例程
    ///
    /// - Parameter value: 待查找的值
    /// - Returns: 查找到的值
    func find(value:T) -> BinaryTree<T>? {
        let current = root
        guard let node = current else { return nil }
        
        if node.value == value {
            return node
        } else if value <= node.value {
            return find(value: (node.leftChildNode?.value)!)
        } else {
            return find(value: (node.rightChildNode?.value)!)
        }
    }
    
}
