//
//  UIView+FakeTap.swift
//  TouchSynthesis
//
//  Created by Mikey Ward on 2/11/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

public extension UIView {
    
    // All the public methods are going here,
    // so that the dispatch(...) mehtod can change its surface nimbly
    // if more features (multitouch, double-taps, etc) are added later.
    
    /// Synthesizes a single `UITouch` at the specified location relative to the view's bounds, akin to a one-finger single-tap.
    ///
    /// `UIWindow` is responsible for dispatching touches to views in its hierarchy,
    /// and so if a view is not attached to a window's view hierarchy, touches cannot be dispatched to the view.
    ///
    /// - Parameters:
    ///   - location: A `Location` relative to the view's bounds.
    ///   - bypassSubviews: If `true`, subviews overlapping the view will not be allowed to intercept the touch. The default value is `false`.
    ///
    /// - Throws: `UITouch.Error.noWindow` if the view has no window.
    
    public func tap(at location: UITouch.Location, bypassSubviews: Bool = false) throws {
        try UITouch.dispatch(to: self, at: location, bypassSubviews: bypassSubviews)
    }
    
}
