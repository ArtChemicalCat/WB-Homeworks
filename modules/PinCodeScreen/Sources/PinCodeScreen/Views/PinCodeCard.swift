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
                .frame(width: .size.quintuple, height: .size.quintuple)
            
            Text(phone)
                .font(.titleH2)
                .padding(.top, .spacing.double)
                .padding(.bottom, .spacing.triple)
            
            PinCodeField(code: code)
                .padding(.bottom, .spacing.double)
                .padding(.horizontal, .spacing.oneAndHalf)
            
            if code.isFailed {
                Text(L10n.wrongPassword)
                    .foregroundStyle(Asset.TextColors.redAlert.swiftUIColor)
            }
            
            if !code.canSend {
                Text(L10n.requestAgainAfter(code.tillNextRequest))
                    .padding(.bottom, .spacing.triple)
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
        .padding(.bottom, .spacing.sextuple)
        .padding(.top, .spacing.topPadding)
        .padding(.horizontal, .spacing.triple)
        .background {
            gradient()
        }
        .overlay {
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.white)
                .opacity(code.isSending ? 1 : 0)
        }
        .clipShape(.rect(cornerRadius: .radius.cornerRadius))
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
private extension HomeWorkUI.Spacings {
    var topPadding: Number { 46 }
}

private extension CornerRadius {
    var cornerRadius: Number { 28 }
}
