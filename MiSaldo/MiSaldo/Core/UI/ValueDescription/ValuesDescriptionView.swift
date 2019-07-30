//
//  ValuesDescriptionView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 20/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct ValuesDescriptionView: View {

    let title: String
    let values: [String]

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .color(.secondary)
                .font(.caption)

            ForEach(values.identified(by: \.self)) { value in
                Text(value)
                    .color(.primary)
            }
        }
    }
}

#if DEBUG
struct ValuesDescriptionView_Previews : PreviewProvider {
    static var previews: some View {
        ValuesDescriptionView(title: "Horarios",
                              values: ["07:00 - 08:59", "18:00 - 19:59"])
            .previewLayout(.fixed(width: 200, height: 100))
    }
}
#endif
