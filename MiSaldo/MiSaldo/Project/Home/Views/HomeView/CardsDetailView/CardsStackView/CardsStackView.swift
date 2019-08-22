//
//  CardsCollectionView.swift
//  DealStack
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

struct CardsStackView : View {

    private struct Constants {
        static let cardsVerticalOffset: Float = 15
        static let cardsScaleOffset: Float = 0.2
    }

    let cards: [Card]
    let selectedCard: Card?
    let didCardMove: () -> Void

    @State private var frontCardDragOffset: CGSize = .zero
    
    var cardMenu: some View {
        Button(action: {}) {
            HStack {
                Text("Borrrar")
                Image(systemName: "trash")
            }
        }
    }
    
    func configureTopCard(card: ModifiedContent<CardView, CardStyleModifier>) -> some View  {
        return card
            .contextMenu { self.cardMenu }
            .gesture(
            DragGesture()
                .onChanged({ value in
                    self.frontCardDragOffset = value.translation
                })
                .onEnded({ value in
                    let finalXTranslation = value.translation.width
                    let movesAtEnd = abs(finalXTranslation) > abs(self.frontCardDragOffset.width)

                    self.frontCardDragOffset = .zero
                    if movesAtEnd {
                        self.didCardMove()
                    }
                })
        )
    }
    
    func getCardView(card: Card) -> ModifiedContent<CardView, CardStyleModifier> {
        CardView(card: card)
        .modifier(
            CardStyleModifier(
                style: self.style(
                    for: card,
                    frontCardDragOffset: self.frontCardDragOffset
                )
            )
        )
    }

    var body: some View {
        ZStack {
            ForEach(cards) { (card) -> AnyView in
                let cardView = self.getCardView(card: card)
                if self.isCardSelected(card: card) {
                    return AnyView(self.configureTopCard(card: cardView))
                } else {
                    return AnyView(cardView)
                }
            }
        }
    }

    private func isCardSelected(card: Card) -> Bool {
        guard let selectedCard = selectedCard else { return false }
        return card.id == selectedCard.id
    }
    
    private func getIndex(for card: Card) -> Int {
        return cards.firstIndex(where: { $0.id == card.id })!
    }

    private func style(for card: Card, frontCardDragOffset: CGSize) -> CardStyle {
        let totalCards = cards.count
        let index = getIndex(for: card)
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
        guard totalCards > 1 else { return 1 }
        
        // Line Ecuation: x = (-y + a) / a
        let scaleFactor: Float = Float(-index + totalCards - 1) / Float(totalCards - 1)
        let scaleOffset = Constants.cardsScaleOffset * scaleFactor
        let animationOffset = Constants.cardsScaleOffset * animationPercentage / 3

        return CGFloat(1 - scaleOffset) + CGFloat(isFrontCard ? 0 : animationOffset)
    }

    private func yPossition(forIndex index: Int, totalCards: Int, isFrontCard: Bool, animationPercentage: Float) -> CGFloat {
        guard totalCards > 1 else { return 0 }
        
        // Line Ecuation: y = (x - a) * b
        let yPos: Float = Float(index - (totalCards - 1)) * -Constants.cardsVerticalOffset
        let animationOffset = -Constants.cardsVerticalOffset * animationPercentage
        return CGFloat(yPos) + CGFloat(isFrontCard ? 0 : animationOffset)
    }

    private func cardDragOffset(isFrontCard: Bool, frontCardDragOffset: CGSize) -> CGFloat {
        guard isFrontCard else { return .zero }
        return frontCardDragOffset.width
    }

    private func cardAlpah(isFrontCard: Bool, animationPercentage: Float) -> Double {
        guard isFrontCard else { return 1 }
        return Double(1 - animationPercentage/2)
    }
}

#if DEBUG
struct CardsStackView_Previews : PreviewProvider {
    static var previews: some View {
        CardsStackView(cards: Card.previewContent,
                       selectedCard: Card.previewContent[0],
                       didCardMove: {})
    }
}
#endif
