import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(14)
            .frame(maxWidth: .infinity)
            .background(
                Asset.BasicColors.purple.swiftUIColor.opacity(
                    configuration.isPressed ? 0.8 : 1
                )
            )
            .cornerRadius(.medium)
    }
}

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}
