//
//  CGRect+Location.swift
//  TouchSynthesis
//
//  Created by Mikey Ward on 2/11/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import Foundation

public extension CGRect {

    /// Returns a random point relative to the rect's origin.
    ///
    /// - Parameter insetBy: a margin applied to the random numbers
    ///
    /// - Precondition: The inset must be less than half the width of the rectangle.
    ///
    /// - Returns: A new CGPoint.
    
    public func randomPoint(insetBy inset: CGFloat = 0) -> CGPoint {
        
        precondition(inset < width/2.0 && inset < height/2.0, "Inset of \(inset) is out of bounds for rect \(self)")
        
        let randomX = CGFloat.random(in: minX + inset ... maxX - inset)
        let randomY = CGFloat.random(in: minY + inset ... maxY - inset)
    
        return CGPoint(x: randomX, y: randomY)
    }
    
}
