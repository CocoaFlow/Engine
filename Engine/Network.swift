//
//  Network.swift
//  Engine
//
//  Created by Paul Young on 15/11/2014.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation

final public class Network {
    public init() {}
    
    // MARK: - Processes
    private var processes: [Int:Component] = [:]
    
    public func addNode<T: Component>(name: String, _ component: T.Type) -> T {
        let process = component(self)
        let id: Int = ObjectIdentifier(process).hashValue
        processes[id] = process
        return process
    }
    
    // MARK: - Connections
    private var connections: [Int:Port] = [:]
    
    public func addEdge<T>(fromPort: OutPort<T>, _ toPort: InPort<T>) {
        connections[fromPort.id] = toPort
    }
    
    // MARK - Sending
    public func send<T>(outPort: OutPort<T>, _ packet: T) {
        if let inPort = connections[outPort.id] as? InPort<T> {
            inPort.receive(packet)
        }
        else {
            println("Unconnected out port on \"\(outPort.process)\" tried to send a packet.")
        }
    }
}
