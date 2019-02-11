//
//  PublicEvent.swift
//  TouchTest
//
//  Created by Mikey Ward on 2/9/19.
//  Copyright © 2019 Mikey Ward. All rights reserved.
//

import Foundation

class PublicEvent: NSObject {
    @objc var _event: GSEventProxy? = nil
    @objc var _timestamp: TimeInterval = 0
    @objc var _touches: NSMutableSet? = nil
    @objc var _keyedTouches: CFMutableDictionary? = nil
}
