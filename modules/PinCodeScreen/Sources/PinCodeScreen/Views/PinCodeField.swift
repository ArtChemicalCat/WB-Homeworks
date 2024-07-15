import SwiftUI
import Observation
import HomeWorkUI

struct PinCodeField: View {
    @Bindable private var code: AuthCode
    @FocusState private var isFocused
    private let codeLength: Int
    
    // MARK: - Initialiser
    init(code: AuthCode, codeLength: Int = 4) {
        self.code = code
        self.codeLength = codeLength
    }
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(0..<codeLength, id: \.self) { index in
                Text(code.digit(at: index))
                    .frame(height: .digitSize.height)
                    .frame(maxWidth: .digitSize.width)
                    .font(.titleH1)
                    .foregroundStyle(
                        code.isFailed ? Asset.TextColors.redAlert.swiftUIColor : .white
                    )
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(.medium)
                    .overlay {
                        RoundedRectangle(cornerRadius: .medium)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(
                                strokeColor()
                            )
                    }
                if index < 3 {
                    Spacer()
                }
            }
        }
        .background(
            TextField("", text: $code.value)
                .focused($isFocused)
                .keyboardType(.decimalPad)
                .opacity(.zero)
                .onChange(of: code.isSending || code.isFailed) { _, disabled in
                    isFocused = !disabled
                }
        )
        .padding(.top, .topPadding)
        .padding(.bottom, .bottomPadding)
        .onChange(of: code.value) { old, new in
            if inputIsValid(new) {
                return
            } else {
                code.value = old
            }
        }
        .onAppear {
            isFocused = true
        }
    }
    
    // MARK: - Methods
    private func inputIsValid(_ input: String) -> Bool {
        input.allSatisfy(\.isNumber) && input.count <= codeLength
    }
    
    private func strokeColor() -> Color {
        if code.isFailed || code.isInvalid {
            return Asset.TextColors.redAlert.swiftUIColor
        }
        
        if code.isValid {
            return Asset.TextColors.green.swiftUIColor
        }
        
        return .clear
    }
}

// MARK: - Constants
fileprivate extension CGFloat {
    static let digitSize: CGSize = .init(width: 64, height: 80)
    static let topPadding: CGFloat = 18
    static let bottomPadding: CGFloat = 30
}
