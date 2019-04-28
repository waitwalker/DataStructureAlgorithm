//
//  DataStructureAlgorithmTests.swift
//  DataStructureAlgorithmTests
//
//  Created by LiuChuanan on 2019/4/9.
//  Copyright © 2019 waitwalker. All rights reserved.
//

import XCTest
@testable import DataStructureAlgorithm

class DataStructureAlgorithmTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }
    
    // MARK: - 链表测试
    func nodeListTest() -> Void {
        // 调试创建链表
        let node1 = NodeList(val: 2)
        let node2 = NodeList(val: 3)
        let node3 = NodeList(val: 8)
        let node4 = NodeList(val: 23)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        print(node1)
        
        // 遍历链表
        let listLength = node1.traverse(with: node1)
        print(listLength)
        
        // 根据指定索引查找某个链表节点的值
        let index0Value = node1.find(with: node1, index: 0)
        print("index0Value:\(index0Value ?? 0)")
        
        let index1Value = node1.find(with: node1, index: 8)
        print("index1Value:\(index1Value ?? 1)")
        
        // 根据指定值查找某个链表节点的所有
        let value0Index = node1.find(with: node1, value: 2)
        print("value0Index:\(value0Index ?? 0)")
        
        let value1Index = node1.find(with: node1, value: 8)
        print("value1Index:\(value1Index ?? 0)")
        
        // 在指定位置插入节点
        let newNode = NodeList(val: 18)
        let newList = node1.insert(with: node1, node: newNode, index: 2)
        print(newList as Any)
        
        // 删除某个位置上的节点
        let detetedList = node1.delete(with: node1, index: 2)
        print(detetedList as Any)
    }
    
    // MARK: - 栈的测试
    func stackTest() -> Void {
        
        let stack = Stack<Int>()
        
        // push 
        stack.push(element: 1)
        stack.push(element: 2)
        stack.push(element: 3)
        stack.push(element: 4)
        stack.push(element: 5)
        
        // isEmpty
        print(stack.isEmpty)
        
        // top
        let top = stack.top()
        print(top as Any)
        
        // pop
        stack.pop()
        print(stack.nodeList as Any)
        
        // MARK: - 数组实现栈
        var stackA = StackA<Int>()
        
        // push
        stackA.push(element: 1)
        stackA.push(element: 2)
        stackA.push(element: 3)
        print(stackA.elements)
        
        // isEmpty
        print(stackA.isEmpty)
        
        // top
        let topA = stackA.top
        print(topA as Any)
        
        // pop
        stackA.pop()
        print(stackA.elements)
    }
    
    // MARK: - 队列测试
    func queueTest() -> Void {
        var queue = Queue<Int>()
        
        // enqueue
        queue.enqueue(element: 1)
        queue.enqueue(element: 2)
        queue.enqueue(element: 3)
        print(queue.elements)
        
        // dequeue
        queue.dequeue()
        print(queue.elements)
        
    }

    // MARK: - 树测试
    func treeTest() -> Void {

        // 定义一个根节点
        let chinaRootNode = Tree(value: "中国")
        // 根节点的一个子节点
        let beijingNode = Tree(value: "北京")
        let dongchengNode = Tree(value: "东城")
        let xichengNode = Tree(value: "西城")
        let fengtaiNode = Tree(value: "丰台")


        // 根节点的一个子节点
        let jiangsuNode = Tree(value: "江苏")
        let nanjingNode = Tree(value: "南京")
        let xuzhouNode = Tree(value: "徐州")
        let changzhouNode = Tree(value: "常州")


        chinaRootNode.addChild(treeNode: beijingNode)
        chinaRootNode.addChild(treeNode: jiangsuNode)

        beijingNode.addChild(treeNode: dongchengNode)
        beijingNode.addChild(treeNode: xichengNode)
        beijingNode.addChild(treeNode: fengtaiNode)

        jiangsuNode.addChild(treeNode: nanjingNode)
        jiangsuNode.addChild(treeNode: xuzhouNode)
        jiangsuNode.addChild(treeNode: changzhouNode)

        print(chinaRootNode.children)

    }
    
    // 二叉树测试
    func binaryTreeTest() -> Void {
        
        // 二叉树的定义
        let rootNode = BinaryTree(value: "北京四中网校")
        let beicheng = BinaryTree(value: "北城总校")
        let nancheng = BinaryTree(value: "南城总校")
        
        let xicheng = BinaryTree(value: "西城分校")
        let dongcheng = BinaryTree(value: "东城分校")
        let fengtai = BinaryTree(value: "丰台分校")
        let fangshan = BinaryTree(value: "房山分校")
        
        let huangchenggen = BinaryTree(value: "皇城根代理")
        let houhai = BinaryTree(value: "后海代理")
        
        rootNode.leftChildNode = beicheng
        rootNode.rightChildNode = nancheng
        
        beicheng.leftChildNode = xicheng
        beicheng.rightChildNode = dongcheng
        
        nancheng.leftChildNode = fengtai
        nancheng.rightChildNode = fangshan
        
        xicheng.leftChildNode = huangchenggen
        xicheng.rightChildNode = houhai
        
        // 先序遍历 递归
        let totalCount = rootNode.traversePreOrder(binaryTree: rootNode)
        print(totalCount)
        
        // 中序遍历 递归
        let totalC = rootNode.traverseInOrder(binaryTree: rootNode)
        print(totalC)
        
        // 后序遍历 递归
        let total = rootNode.traversePostOrder(binaryTree: rootNode)
        print(total)
        
        // 最大深度
        let maxDepth = rootNode.maxDepth(binaryTree: rootNode)
        print(maxDepth)
        
        // 最小深度
        let minDepth = rootNode.minDepth(binaryTree: rootNode)
        print(minDepth)
        
        // 先序遍历 非递归
        let tota = rootNode.traversePreOrderNonrecursive(binaryTree: rootNode)
        print(tota)
        
    }
    
    // 二叉查找树测试
    func binarySearchTreeTest() -> Void {
        let binarySearchTreeNode = BinarySearchTree(value: 123)
        
        // 插入
        binarySearchTreeNode.insert(value: 120)
        binarySearchTreeNode.insert(value: 121)
        binarySearchTreeNode.insert(value: 119)
        binarySearchTreeNode.insert(value: 126)
        binarySearchTreeNode.insert(value: 128)
        binarySearchTreeNode.insert(value: 130)
        binarySearchTreeNode.insert(value: 139)
        print(binarySearchTreeNode.root?.value as Any)
        
        // 查找
        let node = binarySearchTreeNode.find(binaryTree: binarySearchTreeNode.root, value: 128)
        print(node?.value as Any)
        
        // 删除
        binarySearchTreeNode.delete(value: 128)
        
        // 最小值
        let min = binarySearchTreeNode.min()
        print(min?.value as Any)
        
        // 最大值
        let max = binarySearchTreeNode.max()
        print(max?.value as Any)
        
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // 链表测试
        //nodeListTest()
        
        // 栈测试
        //stackTest()
        
        // 队列测试
        //queueTest()

        // 树测试
        //treeTest()
        
        // 二叉树测试
        //binaryTreeTest()
        
        // 二叉查找树测试
        binarySearchTreeTest()

    }
    
    
    func address(o: UnsafeRawPointer) -> String {
        return String.init(format: "%018p", Int(bitPattern: o))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
