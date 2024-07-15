import SwiftUI
import HomeWorkUI

struct PinCodeCard: View {
    // MARK: - State
    @Environment(AuthCode.self) private var code
    
    // MARK: - Properties
    let phone: String
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: .zero) {
            Asset.Icons.envelop.swiftUIImage
                .frame(width: .quintuple, height: .quintuple)
            
            Text(phone)
                .font(.titleH2)
                .padding(.top, .double)
                .padding(.bottom, .triple)
            
            PinCodeField(code: code)
                .padding(.bottom, .double)
                .padding(.horizontal, .oneAndHalf)
            
            if code.isFailed {
                Text(L10n.wrongPassword)
                    .foregroundStyle(Asset.TextColors.redAlert.swiftUIColor)
            }
            
            if !code.canSend {
                Text(L10n.requestAgainAfter(code.tillNextRequest))
                    .padding(.bottom, .triple)
                    .font(.bodyRegular)
            }
            
            Button {
                code.send()
            } label: {
                Text(L10n.authorize)
                    .font(.bodyMedium)
            }
            .buttonStyle(.primary)
        }
        .opacity(code.isSending ? 0 : 1)
        .padding(.bottom, .sextuple)
        .padding(.top, .topPadding)
        .padding(.horizontal, .triple)
        .background {
            gradient()
        }
        .overlay {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)
                .opacity(code.isSending ? 1 : 0)
        }
        .clipShape(.rect(cornerRadius: .cornerRadius))
    }
    
    // MARK: - Methods
    private func gradient() -> some View {
        LinearGradient(
            colors: [
                Asset.Gradients.Bg.start.swiftUIColor,
                Asset.Gradients.Bg.end.swiftUIColor
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

// MARK: - Constants
fileprivate extension CGFloat {
    static let topPadding: CGFloat = 46
    static let cornerRadius: CGFloat = 28

}
