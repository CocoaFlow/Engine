public protocol Port: class {
    var process: Component { get }
}

extension Port {
    public var id: Int {
        return ObjectIdentifier(self).hashValue
    }
}
