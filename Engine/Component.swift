public protocol Component: class {
    var network: Network { get }
    init(_ network: Network)
}

extension Component {
    var id: Int {
        return ObjectIdentifier(self).hashValue
    }
}
