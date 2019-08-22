
import SwiftUI

struct CardStyle {
    let scale: CGFloat
    let yPos: CGFloat
    let dragOffset: CGFloat
    let alpah: Double
}

struct CardStyleModifier: ViewModifier {

    private struct Constants {
        static let shadowRadius: CGFloat = 0.3
        static let animation: Animation = .linear(duration: 0.2)
    }

    let style: CardStyle

    func body(content: Content) -> some View {
        content
            .scaleEffect(style.scale)
            .offset(y: style.yPos)
            .offset(x: style.dragOffset)
            .shadow(radius: Constants.shadowRadius)
            .opacity(style.alpah)
            .animation(Constants.animation)
    }
}
