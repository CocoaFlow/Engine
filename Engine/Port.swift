//
//  Port.swift
//  Engine
//
//  Created by Paul Young on 15/11/2014.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation

public protocol Port: class {
    var process: Component { get }
    var id: Int { get }
}
