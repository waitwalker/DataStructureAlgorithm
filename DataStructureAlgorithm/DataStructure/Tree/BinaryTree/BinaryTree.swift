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

// 二叉树节点个数
fileprivate(set) var kBinaryTreeCount:Int = 0


// MARK: - 二叉树的定义
class BinaryTree<T> {
    
    // 节点value
    var value:T
    
    // 左子树
    var leftChildNode:BinaryTree?
    
    // 右子树
    var rightChildNode:BinaryTree?
    
    // 节点个数
    var count:Int {
        get {
            return kBinaryTreeCount
        }
    }
    
    
    // MARK: - 构造方法
    init(value:T) {
        self.value = value
    }
    
    
    /// 先序遍历:先根节点,然后左子树,然后右子树
    ///
    /// - Parameter binaryTree: 根节点
    func traversePreOrder(binaryTree:BinaryTree?) -> Void {
        
        guard let binaryTreeNode = binaryTree else { 
            print("节点总数:\(kBinaryTreeCount)")
            return 
        }
        kBinaryTreeCount += 1
        print(binaryTreeNode.value,separator: "",terminator: " ")
        binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.leftChildNode)
        binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.rightChildNode)
    }
}


