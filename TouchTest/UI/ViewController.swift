//
//  ViewController.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var target: TargetView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        target = view as? TargetView
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [unowned self] (timer) in
            // For the Swift version
            do {
                try UITouch.dispatch(to: self.view, at: .random, bypassSubviews: true)
            } catch {
                fatalError("\(error)")
            }
            
            // For the Obj-C version
//            let touch = UITouch(in: self.view)
//            let event = UIEvent(touch: touch)
//            self.view.window?.sendEvent(event!)
        })
    }
}

