//
//  PriceView.swift
//  DealStack
//
//  Created by Guilherme Rambo on 04/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import SwiftUI

struct BalanceView : View {
    @State var balance: String

    var body: some View {
        ZStack {
            Text(self.balance)
                .font(.title)
                .fontWeight(.black)
                .color(.black)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
        }.background(
            RoundedRectangle(cornerRadius: 8)
            .foregroundColor(.white)
        )
    }
}

#if DEBUG
struct PriceView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            BalanceView(balance: "2,500")
                .environment(\.colorScheme, .light)

            BalanceView(balance: "2,500")
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 300, height: 300))

    }
}
#endif
