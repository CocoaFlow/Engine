import Foundation
import Engine

final internal class BareComponent: Engine.Component {
    let network: Network
    
    init(_ network: Network) {
        self.network = network
    }
}
