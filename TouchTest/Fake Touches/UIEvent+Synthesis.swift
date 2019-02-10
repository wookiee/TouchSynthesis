//
//  UIEvent+Synthesis.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit
import ObjectiveC

public extension UIEvent {
    
    @objc class func make(with touch: UITouch) -> UIEvent {
        
        let location = touch.location(in: touch.window)
        let size = CGSize(width: 1.0, height: 1.0)
        let flags = CUnsignedInt(touch.phase == .ended ? 0x1010180 : 0x3010180)
        let type = CUnsignedInt(3001)
        
        let eventProxy = GSEventProxy(location: location,
                                      size: size,
                                      touchFlags: flags,
                                      touchType: type)
        
        let touchSet = NSSet(array: [touch])
        
        let touchesEventClass: AnyClass = objc_getClass("UITouchesEvent") as! AnyClass
        var instance: AnyObject = touchesEventClass.alloc() 
        instance = instance.perform(Selector(("_initWithEvent:touches:")), with: eventProxy, with: touchSet) as AnyObject
        
        let eventInstance = unsafeBitCast(instance, to: UIEvent.self)
        return eventInstance
    }
    
}
