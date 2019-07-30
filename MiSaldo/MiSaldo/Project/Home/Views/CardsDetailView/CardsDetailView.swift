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
            CardDetailTopBarView(title: "MiSaldo", action: {})
            .padding(.horizontal, 20)

            ScrollView {
                CardsStackView(
                    cards: self.cards,
                    selectedCard: self.selectedCard) {
                        self.didCardMove()
                }.padding(.horizontal, 20)

                CardGeneralInfoView(
                    balance: self.selectedCard?.balance,
                    lastUpdate: "Hace 30 min"
                )
                .padding(.top, 30.0)
                .padding(.horizontal, 20)

                HStack {
                    PrimaryButton(iconName: "goforward",
                                  title: "Actualizar",
                                  color: self.selectedCard?.vendor.colorBottom,
                                  action: {})
                    SecondaryButton(iconName: "creditcard.fill",
                                    title: "Recarga",
                                    color: self.selectedCard?.vendor.colorBottom,
                                    action: {})

                }
                .padding(.horizontal, 20)

                RatesListView(rates: RateViewModel.previewContent,
                              color: self.selectedCard?.vendor.colorBottom ?? .blue)
                .padding(.horizontal, 20)
            }

        }
    }
}

#if DEBUG
struct CardsDetailView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            CardsDetailView(cards: Card.previewContent,
                            selectedCard: Card.previewContent[0],
                            didCardMove: {})
        }
    }
}
#endif
