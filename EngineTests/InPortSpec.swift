//
//  InPortSpec.swift
//  Engine
//
//  Created by Paul Young on 12/30/14.
//  Copyright (c) 2014 CocoaFlow. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Engine

class InPortSpec: QuickSpec {
    override func spec() {
        
        describe("InPort") {
            var process: BareComponent!
            
            beforeEach {
                let network = Network()
                process = BareComponent(network)
            }
            
            it("should belong to a process") {
                let inPort = InPort<Int>(process) { packet in }
                expect(inPort.process.id).to(equal(process.id))
            }
            
            it("should have a unique ID") {
                let firstInPort = InPort<Int>(process) { packet in }
                let secondInPort = InPort<Int>(process) { packet in }
                expect(firstInPort.id).toNot(equal(secondInPort.id))
            }
            
            it("should receive packets") {
                waitUntil { done in
                    let intPacket = 1
                    
                    let inPort = InPort<Int>(process) { packet in
                        expect(packet).to(equal(intPacket))
                        done()
                    }
                    
                    inPort.receive(intPacket)
                }
            }
        }
    }
}
