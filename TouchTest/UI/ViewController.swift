//
//  ViewController.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import UIKit
import TouchSynthesis

class ViewController: UIViewController {

    var target: TargetView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        target = view as? TargetView
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: { [unowned self] (timer) in
            do {
                try UITouch.dispatch(to: self.view, at: .random, bypassSubviews: true)
            } catch {
                fatalError("\(error)")
            }
        })
    }
}

