import Foundation
import Observation
import Combine

@Observable
final class AuthCode {
    private let dependency: Dependency
    
    private(set) var state: State = .idle
    
    var value: String = "" {
        willSet {
            if value != newValue {
                state = .idle
            }
        }
    }
    
    private(set) var tillNextRequest: Int = .zero
    var canSend: Bool { tillNextRequest == 0 }
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Initialiser
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    // MARK: - Methods
    func digit(at index: Int) -> String {
        guard value.count > index else { return "" }
        let startIndex = value.startIndex
        let targetIndex = value.index(startIndex, offsetBy: index)
        let digit = value[targetIndex]
        
        return String(digit)
    }
    
    func send() {
        guard canSend else { return }
        guard value.count == 4 else { return state = .invalid }
        
        state = .sending
        
        Task {
            do {
                try await dependency.sendCode(value)
                state = .succeeded
            } catch {
                state = .failed
                tillNextRequest = 60
                
                startTimer()
            }
        }
    }
    
    private func startTimer() {
        Timer.publish(every: 1, on: RunLoop.main, in: .common)
            .autoconnect()
            .sink(receiveValue: { [unowned self] _ in
                defer {
                    if tillNextRequest == 0 {
                        state = .idle
                        value.removeAll()
                        subscriptions.removeAll()
                    }
                }
                tillNextRequest -= 1
            })
            .store(in: &subscriptions)
    }
}

// MARK: - State
extension AuthCode {
    enum State {
        case idle
        case sending
        case failed
        case invalid
        case succeeded
    }
    
    var isValid: Bool {
        value.count == 4 && state != .failed
    }
    
    var isFailed: Bool {
        state == .failed
    }
    
    var isInvalid: Bool {
        state == .invalid
    }
    
    var isSending: Bool {
        state == .sending
    }
}
