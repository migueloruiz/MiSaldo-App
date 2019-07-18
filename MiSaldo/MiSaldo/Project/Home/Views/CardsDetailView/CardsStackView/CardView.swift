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

                    Text(self.card.id)
                        .color(.gray)
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(minWidth: 0)
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(20)
                }
                .padding(15)
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
            }
            .clipped()
            .aspectRatio(CGSize(width: Constants.cardAspectRatio, height: 1), contentMode: .fit)
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: .gray, radius: 5, x: 0, y: 0)
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
        .previewLayout(.fixed(width: 400, height: 400))
    }
}
#endif
