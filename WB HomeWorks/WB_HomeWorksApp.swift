import SwiftUI
import HomeWorkUI
import PinCodeScreen

@main
struct WB_HomeworkApp: App {
    var body: some Scene {
        WindowGroup {
            Asset.BasicColors.darkPurple.swiftUIColor
                .overlay {
                    Asset.Images.bgImage.swiftUIImage.resizable()
                }
                .ignoresSafeArea()
                .fullScreenCover(isPresented: .constant(true), content: {
                    PinCodeScreen.Factory.makePinCodeScreen(
                        phoneNumber: "+7 (921) 233-123-44",
                        dependency: .failing
                    )
                })
        }
    }
}
