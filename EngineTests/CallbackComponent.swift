//
//  CallbackComponent.swift
//  Engine
//
//  Created by Paul Young on 12/30/14.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation
import Engine

final internal class CallbackComponent<T>: Engine.Component {
    let network: Network
    lazy var id: Int = ObjectIdentifier(self).hashValue
    
    convenience init(_ network: Network) {
        self.init(network, { packet in })
    }
    
    // Mark: - Callback
    private typealias Callback = (T) -> Void
    private let callback: Callback
    
    init(_ network: Network, _ callback: Callback) {
        self.network = network
        self.callback = callback
    }
    
    // MARK: - Ports
    lazy var inPort: InPort<T> = InPort(self) { packet in
        self.callback(packet)
    }
}
