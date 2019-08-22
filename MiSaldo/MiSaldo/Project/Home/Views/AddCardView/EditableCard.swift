//
//  EditableCard.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct EditableCard: View {

    private struct Constants {
        static let widthProportion: CGFloat = 0.8
        static let cardAspectRatio: CGFloat = 1.58
        static let cornerRadius: CGFloat = 8
    }

    var vendor: CardVendor
    @Binding var id: String

    var body: some View {
        VStack {
            ZStack {
                VStack {
                    HStack(alignment: .top) {
                        Image(self.vendor.image)
                            .animation(.easeIn(duration: 0.2))
                        Spacer()
                    }
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    TextField("Card ID", text: $id)
                    .accentColor(self.vendor.colorTop)
                    .foregroundColor(.secondary)
                    .font(.body)
                    .frame(minWidth: 0)
                    .padding(10)
                    .background(Color.primaryBackground)
                    .cornerRadius(20)
                    .lineLimit(1)
                    .padding(.horizontal, 10)
                    .padding(.bottom, 10)
                }
                .background(
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [self.vendor.colorTop, self.vendor.colorBottom]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .cornerRadius(Constants.cornerRadius)
                )
                .animation(.easeIn(duration: 0.2))
            }
            .clipped()
            .aspectRatio(CGSize(width: Constants.cardAspectRatio, height: 1), contentMode: .fill)
            .cornerRadius(Constants.cornerRadius)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 0)
            }
    }
}

#if DEBUG
struct EditableCard_Previews : PreviewProvider {
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

