//
//  GSEvent.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

/// - Note: GSEvent is an undeclared object.
/// We don't need to use it ourselves but some Apple APIs (UIScrollView in particular)
/// require the x and y fields to be present.
/// Reverse-engineered by Matt Gallagher.

class GSEventProxy: NSObject {
    @objc var flags: UInt = 0
    @objc var type: UInt = 0
    @objc var ignored1: UInt = 0
    @objc var x1: Float = 0
    @objc var y1: Float = 0
    @objc var x2: Float = 0
    @objc var y2: Float = 0
    @objc var ignored2: [Int] = Array(repeating: 0, count: 10)
    @objc var ignored3: [Int] = Array(repeating: 0, count: 7)
    @objc var sizeX: Float = 0
    @objc var sizeY: Float = 0
    @objc var x3: Float = 0
    @objc var y3: Float = 0
    @objc var ignored4: [Int] = Array(repeating: 0, count: 3)

    init(location: CGPoint, size: CGSize, touchFlags: UInt, touchType: UInt) {
        x1 = Float(location.x)
        y1 = Float(location.y)
        x2 = Float(location.x)
        y2 = Float(location.y)
        x3 = Float(location.x)
        y3 = Float(location.y)
        sizeX = Float(size.width)
        sizeY = Float(size.height)
        flags = touchFlags
        type = touchType
    }
}
