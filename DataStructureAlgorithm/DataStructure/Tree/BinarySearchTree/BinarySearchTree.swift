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
    
}
