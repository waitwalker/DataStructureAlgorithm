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

        let node1 = NodeList(val: 2)
        let node2 = NodeList(val: 3)
        let node3 = NodeList(val: 8)
        let node4 = NodeList(val: 23)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        print(node1)
        
        let listLength = node1.traverse(with: node1)
        print(listLength)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
