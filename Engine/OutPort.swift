final public class OutPort<T>: Port {
    public let process: Component
    
    public init(_ process: Component) {
        self.process = process
    }
}
