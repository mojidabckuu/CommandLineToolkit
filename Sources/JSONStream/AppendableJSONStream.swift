import Foundation

public protocol AppendableJSONStream: JSONStream {
    func append(bytes: [UInt8])
}

extension AppendableJSONStream {
    public func append(data: Data) {
        let bytes = [UInt8](data)
        append(bytes: bytes)
    }

    public func append(string: String) {
        append(bytes: Array(string.utf8))
    }
}
