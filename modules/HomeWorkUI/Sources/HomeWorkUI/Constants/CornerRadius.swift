import SwiftUI

public enum CornerRadius: CGFloat {
    /// 8 pt.
    case small = 8
    /// 12 pt.
    case medium = 12
    /// 16 pt.
    case large = 16
}

public extension View {
    func cornerRadius(_ radius: CornerRadius) -> some View {
        clipShape(RoundedRectangle(cornerRadius: radius))
    }
}

public extension RoundedRectangle {
    init(cornerRadius: CornerRadius) {
        self.init(cornerRadius: cornerRadius.rawValue)
    }
}
