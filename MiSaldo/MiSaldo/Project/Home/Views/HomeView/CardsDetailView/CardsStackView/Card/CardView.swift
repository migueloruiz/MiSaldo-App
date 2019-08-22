//
//  CardView.swift
//  Mi Saldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardView: View {

    private struct Constants {
        static let cardAspectRatio: CGFloat = 1.58
        static let cornerRadius: CGFloat = 8
    }

    var card: Card

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(self.card.vendor.image)
                Spacer()
            }
            
            Spacer()
            
            CardIDLabel(value: self.card.id)
        }
        .padding(10)
        .background(
            Rectangle()
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [self.card.vendor.colorTop, self.card.vendor.colorBottom]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .cornerRadius(Constants.cornerRadius)
        )
        .aspectRatio(CGSize(width: Constants.cardAspectRatio, height: 1), contentMode: .fill)
        .cornerRadius(Constants.cornerRadius)
        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
    }
}

#if DEBUG
struct CardView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card.previewContent[1])
                .environment(\.colorScheme, .light)
            
            CardView(card: Card.previewContent[0])
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 400, height: 400))
    }
}
#endif
