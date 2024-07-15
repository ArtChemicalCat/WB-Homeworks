import SwiftUI

public enum Dimension: CGFloat {
    /// 8 pt.
    case single = 8
    /// 12 pt.
    case oneAndHalf = 12
    /// 16 pt.
    case double = 16
    /// 24 pt.
    case triple = 24
    /// 32 pt.
    case quadruple = 32
    /// 40 pt.
    case quintuple = 40
    /// 48 pt.
    case sextuple = 48
}

public extension View {
    func padding(_ edges: Edge.Set, _ length: Dimension) -> some View {
        padding(edges, length.rawValue)
    }
    
    func frame(width: Dimension?, height: Dimension?) -> some View {
        frame(width: width?.rawValue, height: height?.rawValue)
    }
}

public extension VStack {
    init(alignment: HorizontalAlignment = .center, spacing: Dimension, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}

public extension HStack {
    init(alignment: VerticalAlignment = .center, spacing: Dimension, @ViewBuilder content: () -> Content) {
        self.init(alignment: alignment, spacing: spacing.rawValue, content: content)
    }
}
