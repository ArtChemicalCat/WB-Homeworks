import SwiftUI
import HomeWorkUI

struct PinCodeContentView: View {
    let phoneNumber: String
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: .spacing.quadruple) {
                    PinCodeCard(phone: phoneNumber)
                    
                    Button {
                        print("Go back")
                    } label: {
                        HStack {
                            Image(systemName: .chevronLeft)
                            Text(L10n.goBack)
                        }
                        .font(.bodyRegular)
                    }
                    .padding(.bottom, .spacing.double)
                }
                .padding(.horizontal, .spacing.double)
                .frame(maxWidth: .infinity)
                .frame(maxWidth: 400, maxHeight: .infinity)
                .frame(maxWidth: geometry.size.width, minHeight: geometry.size.height)
                .foregroundStyle(.white)
            }
        }
        .presentationBackground(.clear)
    }
}

#Preview {
    PinCodeContentView(phoneNumber: "+7 (921) 233-123-44")
}
