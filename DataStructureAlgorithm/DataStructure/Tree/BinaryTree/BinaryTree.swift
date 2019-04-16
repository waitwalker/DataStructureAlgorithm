//
//  BinaryTree.swift
//  DataStructureAlgorithm
//
//  Created by LiuChuanan on 2019/4/16.
//  Copyright © 2019 waitwalker. All rights reserved.
//
/***
    二叉树
 **/

import UIKit

// MARK: - 二叉树的定义
class BinaryTree<T> {
    
    // 节点value
    var value:T
    
    // 左子树
    var leftChildNode:BinaryTree?
    
    // 右子树
    var rightChildNode:BinaryTree?
    
    // MARK: - 构造方法
    init(value:T) {
        self.value = value
    }
    
    
    /// 先序遍历:先根节点,然后左子树,然后右子树
    ///
    /// - Parameter binaryTree: 二叉树节点
    func traversePreOrder(binaryTree:BinaryTree?) -> Void {
        
        guard let binaryTreeNode = binaryTree else { 
            return 
        }
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
        binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.leftChildNode)
        binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.rightChildNode)
    }
    
    
    /// 中序遍历 先左子树,然后根,然后右子树
    ///
    /// - Parameter binaryTree: 二叉树节点
    func traverseInOrder(binaryTree:BinaryTree?) -> Void {
        guard let binaryTreeNode = binaryTree else { return }
        binaryTreeNode.traverseInOrder(binaryTree: binaryTreeNode.leftChildNode)
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
        binaryTreeNode.traverseInOrder(binaryTree: binaryTreeNode.rightChildNode)
    }
    
    
    /// 后序遍历 先左子树,然后右子树,然后根
    ///
    /// - Parameter binaryTree: 二叉树节点
    func traversePostOrder(binaryTree:BinaryTree?) -> Void {
        guard let binaryTreeNode = binaryTree else { return }
        binaryTreeNode.traversePostOrder(binaryTree: binaryTreeNode.leftChildNode)
        binaryTreeNode.traversePostOrder(binaryTree: binaryTreeNode.rightChildNode)
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
    }
}


