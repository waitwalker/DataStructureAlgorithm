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
    
    /// 右旋转
    ///
    /// - Parameter binaryTreeNode: 待旋转的节点
    /// - Returns: 旋转后的节点
    func rightRotate(binaryTreeNode:BinaryTree<T>?) -> BinaryTree<T>? {
        guard let pivot = binaryTreeNode?.rightChildNode else { return binaryTreeNode }
        binaryTreeNode?.leftChildNode = pivot.rightChildNode
        pivot.rightChildNode = binaryTreeNode
        binaryTreeNode?.height = max((binaryTreeNode?.leftHeight)!, (binaryTreeNode?.rightHeight)!) + 1
        pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
        return pivot
    }
    
    
    /// 左右旋转
    ///
    /// - Parameter binaryTreeNode: 待旋转的节点
    /// - Returns: 选择后的节点
    func leftRightRotate(binaryTreeNode:BinaryTree<T>?) -> BinaryTree<T>? {
        guard let leftChild = binaryTreeNode?.leftChildNode else { return binaryTreeNode }
        binaryTreeNode?.leftChildNode = leftRotate(binaryTreeNode: leftChild)
        return rightRotate(binaryTreeNode: binaryTreeNode)
    }
    
    
    /// 右左旋转
    ///
    /// - Parameter binaryTreeNode: 待旋转的节点
    /// - Returns: 旋转后的节点
    func rightLeftRotate(binaryTreeNode:BinaryTree<T>?) -> BinaryTree<T>? {
        guard let rightChild = binaryTreeNode?.rightChildNode else { return binaryTreeNode }
        binaryTreeNode?.rightChildNode = rightRotate(binaryTreeNode: rightChild)
        return leftRotate(binaryTreeNode: binaryTreeNode)
    }
    
    
    /// 平衡AVL树
    ///
    /// - Parameter binaryTreeNode: 待平衡的节点
    /// - Returns: 平衡后的节点
    func balance(binaryTreeNode:BinaryTree<T>) -> BinaryTree<T> {
        switch binaryTreeNode.balanceFactor {
        case 2:
            if let leftChild = binaryTreeNode.leftChildNode, leftChild.balanceFactor == -1 {
                return leftRightRotate(binaryTreeNode: binaryTreeNode)!
            } else {
                return rightRotate(binaryTreeNode: binaryTreeNode)!
            }
        case -2:
            if let rightChild = binaryTreeNode.rightChildNode, rightChild.balanceFactor == -1 {
                return rightLeftRotate(binaryTreeNode: binaryTreeNode)!
            } else {
                return leftRotate(binaryTreeNode: binaryTreeNode)!
            }
        default:
            return binaryTreeNode
        }
    }
    
    
    /// 插入操作
    ///
    /// - Parameter value: 待插入的值
    func insert(value:T) -> Void {
        root = insert(binaryTreeNode: root, value: value)
    }
    
    private func insert(binaryTreeNode:BinaryTree<T>?, value:T) -> BinaryTree<T>? {
        guard let node = binaryTreeNode else { return BinaryTree(value: value) }
        if value < node.value {
            node.leftChildNode = insert(binaryTreeNode: node.leftChildNode, value: value)
        } else {
            node.rightChildNode = insert(binaryTreeNode: node.rightChildNode, value: value)
        }
        let balanceNode = balance(binaryTreeNode: node)
        balanceNode.height = max(balanceNode.leftHeight, balanceNode.rightHeight) + 1
        return balanceNode
    }
    
    
    /// 删除操作
    ///
    /// - Parameter value: 待删除的值
    func delete(value:T) -> Void {
        root = delete(binaryTreeNode: root, value: value)
    }
    
    func delete(binaryTreeNode:BinaryTree<T>?, value:T) -> BinaryTree<T>? {
        guard let node = binaryTreeNode else { return nil }
        if node.value == value {
            if node.leftChildNode == nil && node.rightChildNode == nil {
                return nil
            }
            
            if node.leftChildNode == nil {
                return node.rightChildNode
            }
            
            if node.rightChildNode == nil {
                return node.leftChildNode
            }
            
            node.value = (node.rightChildNode?.minNode.value)!
            node.rightChildNode = delete(binaryTreeNode: node.rightChildNode, value: node.value)
        } else if value < node.value {
            node.leftChildNode = delete(binaryTreeNode: node.leftChildNode, value: value)
        } else {
            node.rightChildNode = delete(binaryTreeNode: node.rightChildNode, value: value)
        }
        let balanceNode = balance(binaryTreeNode: node)
        balanceNode.height = max(balanceNode.leftHeight, balanceNode.rightHeight) + 1
        return balanceNode
    }
}
