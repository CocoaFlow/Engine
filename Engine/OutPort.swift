final public class OutPort<T>: Port {
    public let process: Component
    lazy public var id: Int = ObjectIdentifier(self).hashValue
    
    public init(_ process: Component) {
        self.process = process
    }
}
