//
//  UITouch+Synthesis.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

public extension UITouch {
    
}

extension UITouch {
    
    /// Instantiate a new UITouch.
    convenience init(in view: UIView, at location: Location, bypassSubviews: Bool) throws {
        
        self.init()
        
        guard let window = view.window else { throw Error.noWindow }

        let coord: CGPoint
        switch location {
        case .origin:
            coord = CGPoint.zero
        case .center:
            let viewFrame = view.frame
            coord = CGPoint(x: viewFrame.width/2.0, y: viewFrame.height/2.0)
        case .point(let pt):
            coord = pt
        case .random:
            let rndPt = view.bounds.randomPoint()
            coord = rndPt
        }
        
        let windowCoord: CGPoint
        let target: UIView?
        if view is UIWindow {
            windowCoord = view.convert(coord, to: window)
            target = bypassSubviews ? view : view.hitTest(coord, with: nil)
        } else {
            windowCoord = coord
            target = bypassSubviews ? view : window.hitTest(coord, with: nil)
        }
        
        // Finally configure the touch, using KVC to set hidden values (reverse-engineered by Matt Gallagher)
        self["tapCount"] = 1
        self["window"] = window
        self["view"] = target
        self["locationInWindow"] = windowCoord
        self["previousLocationInWindow"] = windowCoord
        self["phase"] = UITouch.Phase.began.rawValue
        self["type"] = UITouch.TouchType.direct.rawValue
//        self["touchFlags._firstTouchForView"] = 1
//        self["touchFlags._isTap"] = 1
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    
    }
    
    /// Minor wrapper methtod to create and dispatch a UITouch.
    class func dispatch(to view: UIView, at location: Location, bypassSubviews: Bool) throws {
        let touch = try UITouch(in: view, at: location, bypassSubviews: bypassSubviews)
        let event = UIEvent.make(with: touch)
        view.window?.sendEvent(event)
    }
    
    /// Set a `UITouch`'s `phase` and update its `timestamp` accordingly.
    func setPhase(_ phase: UITouch.Phase) {
        self["phase"] = phase
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    }
    
    /// Set a `UITouch`'s location, and update its previous location and `timestamp` accordingly.
    func setLocationInWindow(_ location: CGPoint) {
        self["previousLocationInWindow"] = self["locationInWindow"]
        self["locationInWindow"] = location
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    }

}
