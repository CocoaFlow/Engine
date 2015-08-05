import Foundation
import Quick
import Nimble
import Engine

class OutPortSpec: QuickSpec {
    override func spec() {
        
        describe("OutPort") {
            var process: BareComponent!
            
            beforeEach {
                let network = Network()
                process = BareComponent(network)
            }
            
            it("should belong to a process") {
                let outPort = OutPort<Int>(process)
                let processId = ObjectIdentifier(process).hashValue
                let outPortProcessId = ObjectIdentifier(outPort.process).hashValue
                expect(outPortProcessId).to(equal(processId))
            }
            
            it("should have a unique ID") {
                let firstOutPort = OutPort<Int>(process)
                let secondOutPort = OutPort<Int>(process)
                expect(firstOutPort.id).toNot(equal(secondOutPort.id))
            }
        }
    }
}
