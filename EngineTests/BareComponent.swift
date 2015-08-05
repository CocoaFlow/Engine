import Engine

final internal class BareComponent: Component {
    let network: Network
    
    init(_ network: Network) {
        self.network = network
    }
}
