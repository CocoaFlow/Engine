//
//  InPort.swift
//  Engine
//
//  Created by Paul Young on 15/11/2014.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation

final public class InPort<T>: Port {
    public let process: Component
    lazy public var id: Int = ObjectIdentifier(self).hashValue
    
    typealias Receiver = (T) -> Void
    public let receive: Receiver
    
    public init(_ process: Component, _ receive: Receiver) {
        self.process = process
        self.receive = receive
    }
}
