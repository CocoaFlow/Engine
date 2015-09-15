public protocol Component: class {
    var network: Network { get }
}

extension Component {
    var id: Int {
        return ObjectIdentifier(self).hashValue
    }
}
