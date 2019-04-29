//
//  AVLTree.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/29.
//  Copyright © 2019 waitwalker. All rights reserved.
//

/**
    AVL树
 */

import UIKit

// MARK: - AVL树
class AVLTree<T:Comparable> {
    
    private(set) var root:BinaryTree<T>?
    
    // MARK: - 构造函数
    init(value:T) {
        self.root = BinaryTree(value: value)
    }
    
    /// 查找操作    
    ///
    /// - Parameters:
    ///   - binaryTreeNode: 根节点
    ///   - value: 待查找的值
    /// - Returns: 查找到的节点
    func find(binaryTreeNode:BinaryTree<T>?, value:T) -> BinaryTree<T>? {
        guard let node = binaryTreeNode else { return nil }
        if node.value == value {
            return node
        } else if value < node.value {
            return find(binaryTreeNode: node.leftChildNode, value: value)
        } else {
            return find(binaryTreeNode: node.rightChildNode, value: value)
        }
    }
    
    
    /// 左旋转
    ///
    /// - Parameter binaryTreeNode: 待旋转的节点
    /// - Returns: 旋转后的节点
    func leftRotate(binaryTreeNode:BinaryTree<T>?) -> BinaryTree<T>? {
        guard let pivot = binaryTreeNode?.rightChildNode else { return binaryTreeNode }
        binaryTreeNode?.rightChildNode = pivot.rightChildNode
        pivot.leftChildNode = binaryTreeNode
        binaryTreeNode?.height = max((binaryTreeNode?.leftHeight)!, (binaryTreeNode?.rightHeight)!) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
}
