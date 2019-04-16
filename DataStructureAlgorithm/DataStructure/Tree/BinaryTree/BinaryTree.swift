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
    /// - Returns: 二叉树节点总数
    func traversePreOrder(binaryTree:BinaryTree?) -> Int {
        
        guard let binaryTreeNode = binaryTree else { 
            return 0
        }
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
        let leftNodeCount = binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.leftChildNode)
        let rigthNodeCount = binaryTreeNode.traversePreOrder(binaryTree: binaryTreeNode.rightChildNode)
        return leftNodeCount + rigthNodeCount + 1
    }
    
    
    /// 中序遍历 先左子树,然后根,然后右子树
    ///
    /// - Parameter binaryTree: 二叉树节点
    func traverseInOrder(binaryTree:BinaryTree?) -> Int {
        guard let binaryTreeNode = binaryTree else { return 0}
        let leftNodeCount = binaryTreeNode.traverseInOrder(binaryTree: binaryTreeNode.leftChildNode)
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
        let rigthNodeCount = binaryTreeNode.traverseInOrder(binaryTree: binaryTreeNode.rightChildNode)
        return leftNodeCount + rigthNodeCount + 1
    }
    
    
    /// 后序遍历 先左子树,然后右子树,然后根
    ///
    /// - Parameter binaryTree: 二叉树节点
    func traversePostOrder(binaryTree:BinaryTree?) -> Int {
        guard let binaryTreeNode = binaryTree else { return 0 }
        let leftNodeCount = binaryTreeNode.traversePostOrder(binaryTree: binaryTreeNode.leftChildNode)
        let rigthNodeCount = binaryTreeNode.traversePostOrder(binaryTree: binaryTreeNode.rightChildNode)
        print("当前节点值:",binaryTreeNode.value,separator: "",terminator: " \n")
        return leftNodeCount + rigthNodeCount + 1
    }
    
    /// 二叉树最大深度
    ///
    /// - Parameter binaryTree: 二叉树节点
    /// - Returns: 最大深度
    func maxDepth(binaryTree:BinaryTree?) -> Int {
        guard let binaryTreeNode = binaryTree else { return 0 }
        
        let leftMaxDepth = maxDepth(binaryTree: binaryTreeNode.leftChildNode)
        let rightMaxDepth = maxDepth(binaryTree: binaryTreeNode.rightChildNode)
        return max(leftMaxDepth, rightMaxDepth) + 1
    }
    
    
    /// 二叉树最小深度
    ///
    /// - Parameter binaryTree: 二叉树节点
    /// - Returns: 最小深度
    func minDepth(binaryTree:BinaryTree?) -> Int {
        guard let binaryTreeNode = binaryTree else { return 0 }
        let leftMinDepth = binaryTreeNode.minDepth(binaryTree: binaryTreeNode.leftChildNode)
        let rightMinDepth = binaryTreeNode.minDepth(binaryTree: binaryTreeNode.rightChildNode)
        return min(leftMinDepth, rightMinDepth) + 1
    }
    
    /***
        先根,然后左子树,然后右子树 非递归实现:
        1)用栈来存储当前节点,判断当前节点是否为空,不为空,将当前节点压栈操作.
        2)判断当前节点的左子树是否为空,左子树不为空则将当前节点的左子树赋值给当前节点;若为空,则取出栈的元素,将栈顶元素的右子树赋值给当前节点,执行1)
        3)直到当前节点为空并且栈为空,遍历结束
     **/
    /// 先序遍历 
    ///
    /// - Parameter binaryTree: 二叉树节点
    /// - Returns: 二叉树节点总数
    func traversePreOrderNonrecursive(binaryTree:BinaryTree?) -> Int {
        var treeStack:[BinaryTree] = []
        var currentNode = binaryTree
        var count:Int = 0
        
        while !treeStack.isEmpty || currentNode != nil{
            if currentNode != nil {
                treeStack.append(currentNode!)
                currentNode = currentNode?.leftChildNode
                count += 1
                print(currentNode?.value as Any)
            } else {
                let lastTreeNode = treeStack.removeLast()
                currentNode = lastTreeNode.rightChildNode
            }
        }
        return count
    }
}


