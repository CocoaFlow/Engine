import Foundation

public protocol Component: class {
    var network: Network { get }
    init(_ network: Network)
}
