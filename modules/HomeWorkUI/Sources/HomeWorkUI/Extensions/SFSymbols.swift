import SwiftUI

public enum SFSymbols: String {
    case chevronLeft = "chevron.left"
}

public extension Image {
    init(systemName: SFSymbols) {
        self.init(systemName: systemName.rawValue)
    }
}
