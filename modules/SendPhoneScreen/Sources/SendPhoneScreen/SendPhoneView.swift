import SwiftUI
import HomeWorkUI
import Observation

public struct SendPhoneView: View {
    @Bindable private var phoneNumber: PhoneNumber = .init()
    
    @State private var text: String = ""
    
    public init() {}
    public var body: some View {
        VStack {
            Text("Авторизация")
                .font(.titleH2)
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 96, height: 96)
            
            Text("Вход по номеру телефона")
                .font(.bodyRegular)
            
            TextField("", text: $text)
                .background(.red)
                .font(.bodyMedium)
        }
        .foregroundStyle(.white)
        .onChange(of: text) { old, new in
            phoneNumber.rawNumber = new
        }
        .onChange(of: phoneNumber.rawNumber) { old, new in
            
        }
        .background(
            Color.gray
        )
    }
}

#Preview {
    SendPhoneView()
}
