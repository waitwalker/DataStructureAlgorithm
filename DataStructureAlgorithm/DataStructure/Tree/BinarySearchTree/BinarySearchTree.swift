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
    func find(binaryTree:BinaryTree<T>?, value:T) -> BinaryTree<T>? {
        guard let node = binaryTree else { return nil }
        
        if node.value == value {
            return node
        } else if value < node.value {
            return find(binaryTree: node.leftChildNode, value: value)
        } else {
            return find(binaryTree: node.rightChildNode, value: value)
        }
    }
    
    /***
     1)先创建一个新节点,如果新节点的值与根节点的值相等,则插入到根节点位置
     2)如果新节点的值小于等于根节点的值,则将新节点赋值给根节点的左子树
     3)如果新节点的值大于根节点的值,则将新节点赋值给根节点的右子树
     4)递归执行以上步骤
     */
    /// 插入例程
    ///
    /// - Parameter value: 插入的值
    /// - Returns: 插入后返回的二叉查找树
    func insert(value:T) -> Void {
        root = insert(root: root, value: value)
    }
    
    private func insert(root binaryTree:BinaryTree<T>?, value:T) -> BinaryTree<T>? {
        guard let node = binaryTree else { return BinaryTree(value: value) }
        if value <= node.value {
            node.leftChildNode = insert(root: node.leftChildNode, value: value)
        } else {
            node.rightChildNode = insert(root: node.rightChildNode, value: value)
        }
        return node
    }
    
}
