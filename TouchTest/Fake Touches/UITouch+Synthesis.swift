//
//  UITouch+Synthesis.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

extension UITouch {
    
    // Locations are in a target view's coordinate system
    enum Location {
        case center
        case origin
        case point(CGPoint)
        case random
    }
    
    enum Error: Swift.Error {
        case noWindow // the view has no window, and so can't receieve touches
    }
    
    convenience init(in view: UIView, at location: Location = .center, bypassSubviews: Bool = false) throws {
        
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
            let rndX = CGFloat.random(in: 0...view.bounds.maxX)
            let rndY = CGFloat.random(in: 0...view.bounds.maxY)
            let rndPt = CGPoint(x: rndX, y: rndY)
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
        
        // Finally configure the touch
        self["tapCount"] = 1
        self["window"] = window
        self["view"] = target
        self["locationInWindow"] = windowCoord
        self["previousLocationInWindow"] = windowCoord
        self["phase"] = UITouch.Phase.began.rawValue
        self["type"] = UITouch.TouchType.direct.rawValue
//        self["touchFlags._firstTouchForView"] = 1
//        self["touchFlags._isTap"] = 1
//        print(self["touchFlags"])
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    
    }
    
    class func dispatch(to view: UIView, at location: Location = .center, bypassSubviews: Bool = false) throws {
        // For Swift Version
        let touch = try UITouch(in: view, at: location, bypassSubviews: bypassSubviews)
        let event = UIEvent(touch: touch)
        view.window?.sendEvent(event)
        
        // For Obj-C Version
//        let touch = try UITouch(in: view, at: location, bypassSubviews: bypassSubviews)
//        let event = UIEvent(touch: touch)
//        view.window?.sendEvent(event)
    }
    
    func setPhase(_ phase: UITouch.Phase) {
        self["phase"] = phase
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    }
    
    func setLocationInWindow(_ location: CGPoint) {
        self["previousLocationInWindow"] = self["locationInWindow"]
        self["locationInWindow"] = location
        self["timestamp"] = Date.timeIntervalSinceReferenceDate
    }

}
