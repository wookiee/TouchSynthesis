//
//  TargetView.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

class TargetView: UIView {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            addDot(at: touch.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            addDot(at: touch.location(in: self))
        }
    }
    
    func addDot(at pt: CGPoint) {
        let edgeLength: CGFloat = 5
        let dot = UIView(frame: CGRect(x: pt.x - edgeLength/2.0,
                                       y: pt.y - edgeLength/2.0,
                                       width: edgeLength,
                                       height: edgeLength))
        dot.backgroundColor = .red
        dot.layer.cornerRadius = edgeLength/2.0
        addSubview(dot)
    }
}
