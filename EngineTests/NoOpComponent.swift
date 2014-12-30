//
//  NoOpComponent.swift
//  Engine
//
//  Created by Paul Young on 12/30/14.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation
import Engine

final internal class NoOpComponent<T>: Engine.Component {
    let network: Network
    
    init(_ network: Network) {
        self.network = network
    }
    
    // MARK: - Ports
    lazy var inPort: InPort<T> = InPort(self) { packet in
        self.network.send(self.outPort, packet)
    }
    
    lazy var outPort: OutPort<T> = OutPort(self)
}
