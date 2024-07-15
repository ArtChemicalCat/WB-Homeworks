public struct Dependency {
    let sendCode: (String) async throws -> Void
    
    public init(sendCode: @escaping (String) async throws -> Void) {
        self.sendCode = sendCode
    }
}

public extension Dependency {
    static var unimplemented: Dependency {
        .init(sendCode: { _ in fatalError() })
    }
    
    static var mock: Dependency {
        .init(sendCode: {
            print("Sending code: \($0)")
            try await Task.sleep(for: .seconds(1.5))
        })
    }
    
    static var failing: Dependency {
        struct Error: Swift.Error {}
        
        return .init(sendCode: {
            print("Sending code: \($0)")
            try await Task.sleep(for: .seconds(1.5))
            throw Error()
        })
    }
}
