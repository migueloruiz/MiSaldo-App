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
                .foregroundColor(.secondary)
                .font(.caption)
            Text(value ?? "--")
                .foregroundColor(.primaryText)
                .font(.title)
        }
    }
}

#if DEBUG
struct ValueDescriptionView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
             ValueDescriptionView(valueName: "Saldo", value: "$8000")
                .environment(\.colorScheme, .light)

             ValueDescriptionView(valueName: "Saldo", value: "$8000")
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 150, height: 150))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBackground)
    }
}
#endif
