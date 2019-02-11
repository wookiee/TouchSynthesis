//
//  UITouch+Location.swift
//  TouchSynthesis
//
//  Created by Mikey Ward on 2/11/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

public extension UITouch {
    
    /// Defines errors which might be thrown
    public enum Error: Swift.Error {
        
        /// The view has no window, and so can't receieve touches
        case noWindow
    }
    
    /// Select a location (relative to a touch's target view) where a touch should land.
    public enum Location {
        
        /// The center point of the view.
        case center
        
        /// The view's origin, `CGPoint(x: 0, y: 0)`.
        case origin
        
        /// A custom location in the view's coordinate space.
        case point(CGPoint)
        
        /// A random location in the view's coordinate space, at least `insetBy` points from the edge of the view's bounds.
        case random(insetBy: CGFloat)
    }
    
}
