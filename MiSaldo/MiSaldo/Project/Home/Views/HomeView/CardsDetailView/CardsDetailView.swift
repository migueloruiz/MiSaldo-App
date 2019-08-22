//
//  CardsDetailView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardsDetailView: View {

    let cards: [Card]
    let selectedCard: Card?
    let didCardMove: () -> Void

    var body: some View {
        VStack {
            CardsStackView(
                cards: self.cards,
                selectedCard: self.selectedCard) {
                    self.didCardMove()
            }.frame(minWidth: 0, maxWidth: .infinity)

            CardGeneralInfoView(
                balance: self.selectedCard?.balance,
                lastUpdate: "Hace 30 min"
            ).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))

            HStack {
                PrimaryButton(iconName: "goforward",
                              title: "Actualizar",
                              color: self.selectedCard?.vendor.colorBottom,
                              action: {})
                    .animation(.easeInOut(duration: 0.3))
                SecondaryButton(iconName: "creditcard.fill",
                              title: "Recarga",
                              color: self.selectedCard?.vendor.colorBottom,
                              action: {})
                    .animation(.easeInOut(duration: 0.3))

            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

#if DEBUG
struct CardsDetailView_Previews : PreviewProvider {
    @State private var cards: [Card] = Card.previewContent
    static var previews: some View {
        CardsDetailView(
            cards: Card.previewContent,
            selectedCard: Card.previewContent[0],
            didCardMove: {}
        )
        .padding(20)
    }
}
#endif
