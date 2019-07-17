//
//  CardsDetailView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardsDetailView : View {

    let cards: [Card]
    let selectedCard: Card?
    let didCardMove: () -> Void


    var body: some View {
        VStack {
            CardsStackView(
                cards: self.cards,
                selectedCard: self.selectedCard) {
                    self.didCardMove()
                }
            HStack {
                ValueDescriptionView(
                    valueName: "SALDO",
                    value: self.selectedCard?.balance
                )
                Spacer()
                ValueDescriptionView(
                    valueName: "Actualizado",
                    value: "Hace 30 min"
                )
            }.padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
            
        }.padding(20)
    }
}

#if DEBUG
struct CardsDetailView_Previews : PreviewProvider {
    static var previews: some View {
        CardsDetailView(cards: Card.previewContent,
                       selectedCard: Card.previewContent[0],
                       didCardMove: {})
    }
}
#endif
