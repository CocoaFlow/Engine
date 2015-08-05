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
