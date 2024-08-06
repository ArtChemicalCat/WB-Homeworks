import Observation

@Observable
final class PhoneNumber {
    let code: Int = 7
    let mask: String
    let maskCharacter: Character
    
    @ObservationIgnored
    var rawNumber: String = "" {
        didSet {
            rawNumber = formatted()
        }
    }
    
    init(mask: String = "+7 (___) ___-__-__", maskCharacter: Character = "_") {
        self.mask = mask
        self.maskCharacter = maskCharacter
        rawNumber = formatted()
    }
    
    func formatted() -> String {
        mask.reduce(into: (result: String(), rawNumber: rawNumber)) { accumulated, character in
            if character != maskCharacter || accumulated.rawNumber.isEmpty {
                accumulated.result.append(character)
            } else {
                accumulated.result.append(accumulated.rawNumber.removeFirst())
            }
        }
        .result
    }
}
