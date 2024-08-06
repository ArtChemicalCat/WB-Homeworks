import SwiftUI

public enum Factory {
    public static func makePinCodeScreen(
        phoneNumber: String,
        dependency: Dependency
    ) -> some View {
        PinCodeContentView(phoneNumber: phoneNumber)
            .environment(AuthCode(dependency: dependency))
    }
}
