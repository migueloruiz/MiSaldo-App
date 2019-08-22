//
//  PriceView.swift
//  Mi Saldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct BalanceView : View {
    @State var balance: String

    var body: some View {
        ZStack {
            Text(self.balance)
                .font(.title)
                .padding(.vertical, 4)
                .padding(.horizontal, 8)
                .foregroundColor(.primaryText)
        }.background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.primaryBackground)
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
        .previewLayout(.fixed(width: 200, height: 100))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.black)

    }
}
#endif
