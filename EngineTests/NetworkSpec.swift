//
//  NetworkSpec.swift
//  Engine
//
//  Created by Paul Young on 12/30/14.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Engine

class NetworkSpec: QuickSpec {
    override func spec() {
        
        describe("Network") {
            var network: Network!
            
            beforeEach {
                network = Network()
            }
            
            it("should add edges") {
                waitUntil { done in
                    let intPacket = 1
                    let noOp = NoOpComponent<Int>(network)
                    
                    let callback = CallbackComponent<Int>(network) { packet in
                        expect(packet).to(equal(intPacket))
                        done()
                    }
                    
                    network.addEdge(noOp.outPort, callback.inPort)
                    noOp.inPort.receive(intPacket)
                }
            }
        }
    }
}
