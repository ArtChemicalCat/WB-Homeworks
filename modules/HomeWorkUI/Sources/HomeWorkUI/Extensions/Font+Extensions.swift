import SwiftUI

public extension SwiftUI.Font {
    private static func montserrat(size: CGFloat, weight: Weight) -> SwiftUI.Font {
        switch weight {
        case .regular:
            FontFamily.Montserrat.regular.swiftUIFont(size: size)
        case .medium:
            FontFamily.Montserrat.medium.swiftUIFont(size: size)
        case .bold:
            FontFamily.Montserrat.bold.swiftUIFont(size: size)
        default:
            FontFamily.Montserrat.regular.swiftUIFont(size: size)
        }
    }
    
    static var bodyRegular: SwiftUI.Font {
        .montserrat(size: 14, weight: .regular)
    }
    
    static var bodyMedium: SwiftUI.Font {
        .montserrat(size: 16, weight: .regular)
    }
    
    static var titleH1: SwiftUI.Font {
        .montserrat(size: 36, weight: .regular)
    }
    
    static var titleH2: SwiftUI.Font {
        .montserrat(size: 24, weight: .regular)
    }
}
