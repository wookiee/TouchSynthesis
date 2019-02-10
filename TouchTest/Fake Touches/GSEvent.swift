//
//  GSEvent.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import Foundation

// GSEvent is an undeclared object. We don't need to use it ourselves but some
// Apple APIs (UIScrollView in particular) require the x and y fields to be present.

public class GSEventProxy: NSObject {
    @objc var flags: CUnsignedInt = 0
    @objc var type: CUnsignedInt = 0
    @objc var ignored1: CUnsignedInt = 0
    @objc var x1: CFloat = 0
    @objc var y1: CFloat = 0
    @objc var x2: CFloat = 0
    @objc var y2: CFloat = 0
    @objc var ignored2: [CInt] = Array(repeating: 0, count: 10)
    @objc var ignored3: [CInt] = Array(repeating: 0, count: 7)
    @objc var sizeX: CFloat = 0
    @objc var sizeY: CFloat = 0
    @objc var x3: CFloat = 0
    @objc var y3: CFloat = 0
    @objc var ignored4: [CInt] = Array(repeating: 0, count: 3)

    init(location: CGPoint, size: CGSize, touchFlags: CUnsignedInt, touchType: CUnsignedInt) {
        x1 = CFloat(location.x)
        y1 = CFloat(location.y)
        x2 = CFloat(location.x)
        y2 = CFloat(location.y)
        x3 = CFloat(location.x)
        y3 = CFloat(location.y)
        sizeX = CFloat(size.width)
        sizeY = CFloat(size.height)
        flags = touchFlags
        type = touchType
    }
}
