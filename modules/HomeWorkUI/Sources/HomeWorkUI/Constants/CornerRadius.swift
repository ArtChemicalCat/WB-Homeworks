import SwiftUI

public struct CornerRadius<Number: Numeric> {
    /// 8 pt.
    public let small: Number = 8
    /// 12 pt.
    public let medium: Number = 12
    /// 16 pt.
    public let large: Number = 16
}

public extension CGFloat {
    static var radius: CornerRadius<Self> {
        CornerRadius()
    }
}
