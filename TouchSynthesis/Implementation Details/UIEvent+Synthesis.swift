//
//  UIEvent+Synthesis.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit
import ObjectiveC

extension UIEvent {
    
    /// Creates a new `UIEvent` wrapping a `UITouch` instance.
    ///
    /// - Parameter touch: The `UITouch` to sit at the heart of the new `UIEvent`.
    ///
    /// - Returns: The newly-instantiated `UIEvent`.
    ///
    /// - Note: Uses lots of magic numbers, runtime hackery, and undocumented API. Do not use in production.
    
    @objc class func make(with touch: UITouch) -> UIEvent {
        
        let location = touch.location(in: touch.window)
        let size = CGSize(width: 1.0, height: 1.0)
        let flags = UInt(touch.phase == .ended ? 0x1010180 : 0x3010180)
        let type = UInt(3001)
        
        let selector = Selector(("_initWithEvent:touches:"))
        let touchSet = NSSet(array: [touch])
        let eventProxy = GSEventProxy(location: location,
                                      size: size,
                                      touchFlags: flags,
                                      touchType: type)
        
        let eventClass: AnyClass = objc_getRequiredClass("UITouchesEvent")
        var instance: AnyObject = eventClass.alloc()
        instance = instance.perform(selector, with: eventProxy, with: touchSet)!.takeUnretainedValue()
        return instance as! UIEvent
    }
    
}
