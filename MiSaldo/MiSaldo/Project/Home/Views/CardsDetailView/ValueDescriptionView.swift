//
//  ValueDescriptionView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct ValueDescriptionView : View {

    let valueName: String
    let value: String?

    var body: some View {
        VStack(alignment: .leading) {
            Text(valueName)
                .color(.gray)
                .font(.caption)
                .fontWeight(.bold)
            Text(value ?? "--")
                .color(.black)
                .font(.title)

        }
    }
}

#if DEBUG
struct ValueDescriptionView_Previews : PreviewProvider {
    static var previews: some View {
        ValueDescriptionView(valueName: "Saldo", value: "$8000")
        .previewLayout(.fixed(width: 100, height: 100))
    }
}
#endif
