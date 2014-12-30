//
//  BareComponent.swift
//  Engine
//
//  Created by Paul Young on 12/30/14.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation
import Engine

final internal class BareComponent: Engine.Component {
    let network: Network
    lazy var id: Int = ObjectIdentifier(self).hashValue
    
    init(_ network: Network) {
        self.network = network
    }
}
