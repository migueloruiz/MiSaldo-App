//
//  CardsCollectionView.swift
//  DealStack
//
//  Created by Guilherme Rambo on 03/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import SwiftUI
import Combine

struct CardsStackView : View {

    private struct Constants {
        static let cardsVerticalOffset: Float = 20
        static let cardsScaleOffset: Float = 0.2
    }

    @State private var frontCardDragOffset: CGSize = .zero
    @ObjectBinding var controller: CardsControllerImpl

    var body: some View {
        VStack {
            ZStack {
                ForEach(controller.cards) { card in
                    return CardView(card: card)
                        .modifier(
                            CardStyleModifier(
                                style: self.style(
                                    for: card,
                                    frontCardDragOffset: self.frontCardDragOffset
                                )
                            )
                        )
                        .gesture(DragGesture().onChanged({ value in
                            self.frontCardDragOffset = value.translation
                            }).onEnded({ value in
                                self.frontCardDragOffset = .zero
                                if abs(value.translation.width) > UIScreen.main.bounds.width/4 {
                                    self.controller.nextCardToFront()
                                }
                            }))
                        }
            }.padding(20)

            HStack {
                ForEach(controller.cards) { card in
                    Circle()
                        .fill(self.isCardSelected(card: card) ? Color.gray : Color.red)
                    .frame(width: 10)
                }
            }.frame(height: 20)
        }
    }

    private func isCardSelected(card: Card) -> Bool {
        guard let selectedCard = controller.slectedCard else { return false }
        print(card.id, selectedCard.id, card.id == selectedCard.id)
        return card.id == selectedCard.id
    }

    private func style(for card: Card, frontCardDragOffset: CGSize) -> CardStyle {
        let totalCards = controller.cards.count
        let index = controller.index(for: card)
        let isFrontCard = index == totalCards - 1

        let maxPosition = UIScreen.main.bounds.width
        let animationPercentage = abs(Float(frontCardDragOffset.width/maxPosition))

        let scale = cardScale(
            forIndex: index,
            totalCards: totalCards,
            isFrontCard: isFrontCard,
            animationPercentage: animationPercentage
        )

        let yPos = yPossition(
            forIndex: index,
            totalCards: totalCards,
            isFrontCard: isFrontCard,
            animationPercentage: animationPercentage
        )

        let dragOffset = cardDragOffset(isFrontCard: isFrontCard,
                                    frontCardDragOffset: frontCardDragOffset)

        let alpha = cardAlpah(isFrontCard: isFrontCard,
                              animationPercentage: animationPercentage)

        return CardStyle(scale: scale,
                         yPos: yPos,
                         dragOffset: dragOffset,
                         alpah: alpha)
    }

    private func cardScale(forIndex index: Int, totalCards: Int, isFrontCard: Bool, animationPercentage: Float) -> CGFloat {
        // Line Ecuation: x = (-y + a) / a
        let scaleFactor: Float = Float(-index + totalCards - 1) / Float(totalCards - 1)
        let scaleOffset = Constants.cardsScaleOffset * scaleFactor
        let animationOffset = Constants.cardsScaleOffset * animationPercentage / 3

        return CGFloat(1 - scaleOffset) + CGFloat(isFrontCard ? 0 : animationOffset)
    }

    private func yPossition(forIndex index: Int, totalCards: Int, isFrontCard: Bool, animationPercentage: Float) -> CGFloat {
        // Line Ecuation: x = -y + a * b
        let yPos: Float = Float(-index + totalCards - 1) * -Constants.cardsVerticalOffset
        let animationOffset = Constants.cardsVerticalOffset * animationPercentage
        return CGFloat(yPos) + CGFloat(isFrontCard ? 0 : animationOffset)
    }

    private func cardDragOffset(isFrontCard: Bool, frontCardDragOffset: CGSize) -> CGFloat {
        guard isFrontCard else { return .zero }
        return frontCardDragOffset.width
    }

    private func cardAlpah(isFrontCard: Bool, animationPercentage: Float) -> Double {
        guard isFrontCard else { return 1 }
        return Double(1 - animationPercentage)
    }
}

struct CardStyle {
    let scale: CGFloat
    let yPos: CGFloat
    let dragOffset: CGFloat
    let alpah: Double
}

struct CardStyleModifier: ViewModifier {

    private struct Constants {
        static let shadowRadius: CGFloat = 0.3
        static let animation: Animation = .basic(duration: 0.2, curve: .easeOut)
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

#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        CardsStackView(cards: Card.previewContent.sorted(by: { $0.order < $1.order }))
//    }
//}
#endif
