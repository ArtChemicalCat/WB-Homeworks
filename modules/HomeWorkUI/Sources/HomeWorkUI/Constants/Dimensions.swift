import SwiftUI

public struct Spacings<Number: Numeric> {
    /// 8 pt.
    public let single: Number = 8
    /// 12 pt.
    public let oneAndHalf: Number = 12
    /// 16 pt.
    public let double: Number = 16
    /// 24 pt.
    public let triple: Number = 24
    /// 32 pt.
    public let quadruple: Number = 32
    /// 40 pt.
    public let quintuple: Number = 40
    /// 48 pt.
    public let sextuple: Number = 48
}

public extension CGFloat {
    static var spacing: Spacings<Self> {
        Spacings()
    }
    
    static var size: Spacings<Self> {
        Spacings()
    }
}
