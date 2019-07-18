//
//  CardGeneralInfoView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 17/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardGeneralInfoView : View {

    let balance: String?
    let lastUpdate: String

    var body: some View {
        return HStack {
            ValueDescriptionView(
                valueName: "Saldo",
                value: balance ?? "--"
            )
            Spacer()
            ValueDescriptionView(
                valueName: "Actualizado",
                value: lastUpdate ?? "__"
            )
        }
    }
}

#if DEBUG
struct CardGeneralInfoView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CardGeneralInfoView(balance: "$800", lastUpdate: "Hace 30 min")
        }.previewLayout(
            .fixed(width: 400, height: 100)
        ).padding(20)
    }
}
#endif
