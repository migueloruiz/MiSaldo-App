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
            HStack {
                Text("Mi Saldo")
                    .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .color(.primary)
                Spacer()
                Button(action: {

                }) {
                    Image(systemName: "plus.circle.fill")
                    .accentColor(.secondary)
                    .font(Font.title.weight(.bold))
                }
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

            CardsStackView(
                cards: self.cards,
                selectedCard: self.selectedCard) {
                    self.didCardMove()
            }

            CardGeneralInfoView(
                balance: self.selectedCard?.balance,
                lastUpdate: "Hace 30 min"
            ).padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))

            HStack {
                PrimaryButton(iconName: "goforward",
                              title: "Actualizar",
                              color: self.selectedCard?.vendor.colorBottom,
                              action: {print(345678)}).animation(Animation.basic(duration: 0.3, curve: .easeInOut))
                SecondaryButton(iconName: "creditcard.fill",
                              title: "Recarga",
                              color: self.selectedCard?.vendor.colorBottom,
                              action: {print(345678)})
                .animation(Animation.basic(duration: 0.3, curve: .easeInOut))

            }.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            
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
