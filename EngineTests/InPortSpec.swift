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
                let processId = ObjectIdentifier(process).hashValue
                let inPortProcessId = ObjectIdentifier(inPort.process).hashValue
                expect(inPortProcessId).to(equal(processId))
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
