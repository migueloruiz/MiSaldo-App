//
//  DealView.swift
//  DealStack
//
//  Created by Guilherme Rambo on 04/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import SwiftUI

struct CardView: View {

    private struct Constants {
        static let widthProportion: CGFloat = 0.8
        static let cardAspectRatio: CGFloat = 1.58
        static let cornerRadius: CGFloat = 8
    }

    var card: Card

    var body: some View {

        VStack {
            ZStack {
                VStack {
                    HStack(alignment: .top) {
                        Image(self.card.vendor.image)
                        Spacer()
                    }
                    Spacer()
                    CardIDLabelView(value: self.card.id)
                }
                .padding(15)
                .background(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [self.card.vendor.colorTop, self.card.vendor.colorBottom]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .cornerRadius(Constants.cornerRadius)
                )
            }
            .clipped()
            .aspectRatio(CGSize(width: Constants.cardAspectRatio, height: 1), contentMode: .fill)
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
            }
    }
}

#if DEBUG
struct DealView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CardView(card: Card.previewContent[1])
            CardView(card: Card.previewContent[0])

        }
        .padding()
        .previewLayout(.fixed(width: 400, height: 250))
    }
}
#endif
