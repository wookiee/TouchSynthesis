//
//  NSObject+KVC.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import Foundation

extension NSObject {
    subscript (index: String) -> Any? {
        get {
            return value(forKeyPath: index)
        }
        set {
            setValue(newValue, forKeyPath: index)
        }
    }
}
