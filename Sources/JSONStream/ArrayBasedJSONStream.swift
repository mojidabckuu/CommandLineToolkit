final class ArrayBasedJSONStream: AppendableJSONStream {
    private var storage = [UInt8]([])

    init(storage: [UInt8] = [UInt8]([])) {
        self.storage = storage.reversed()
    }

    public func touch() -> UInt8? {
        lastByte(delete: false)
    }

    public func read() -> UInt8? {
        lastByte(delete: true)
    }

    public func close() { }

    func append(bytes: [UInt8]) {
        storage.insert(contentsOf: bytes.reversed(), at: 0)
    }

    private func lastByte(delete: Bool) -> UInt8? {
        if storage.isEmpty {
            return nil
        }

        return if delete {
            storage.popLast()
        } else {
            storage.last
        }
    }
}
