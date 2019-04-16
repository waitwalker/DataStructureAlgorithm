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
    
    
}


