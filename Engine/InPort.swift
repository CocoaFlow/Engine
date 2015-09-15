final public class InPort<T>: Port {
    public let process: Component
    
    public typealias Receiver = (T) -> Void
    public let receive: Receiver
    
    public init(_ process: Component, _ receive: Receiver) {
        self.process = process
        self.receive = receive
    }
}
