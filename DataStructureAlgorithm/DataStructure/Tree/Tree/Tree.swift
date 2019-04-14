//
//  Tree.swift
//  DataStructureAlgorithm
//
//  Created by WangJunZi on 2019/4/14.
//  Copyright © 2019 waitwalker. All rights reserved.
//

/**
    树
 */

import UIKit

// MARK: - 树
class Tree<T:Equatable> {

    // 节点value
    var value:T

    // 子节点
    private(set) var children:[Tree] = []

    // 父节点
    var parent:Tree?

    // MARK: - 构造函数
    init(value:T) {
        self.value = value
    }


    /// 添加节点
    ///
    /// - Parameter treeNode: 子节点
    func addChild(treeNode:Tree) -> Void {
        children.append(treeNode)
        treeNode.parent = self
    }
}

// MARK: - description extension
extension Tree:CustomStringConvertible {
    var description: String {
        var valueString = "\(value)"
        guard !children.isEmpty else {
            return valueString
        }
        valueString += "{" + children.map({$0.description}).joined(separator: ",") + "}"
        return valueString
    }
}
