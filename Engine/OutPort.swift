//
//  OutPort.swift
//  Engine
//
//  Created by Paul Young on 15/11/2014.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation

final public class OutPort<T>: Port {
    public let process: Component
    lazy public var id: Int = ObjectIdentifier(self).hashValue
    
    public init(_ process: Component) {
        self.process = process
    }
}
