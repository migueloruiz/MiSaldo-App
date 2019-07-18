//
//  SecondaryButton.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 17/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct SecondaryButton : View {
    let iconName: String
    let title: String
    let color: Color?
    let action: () -> Void

    var body: some View {
        return Button(action: action) {
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                Image(systemName: iconName)
                    .accentColor(color)
                    .font(Font.callout.weight(.bold))
                Text(title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .color(color)
                Spacer()
            }
        }
        .padding(10)
        .clipped()
        .frame(minWidth: 0, maxWidth: .infinity)
        .border(color ?? Color.red, width: 2, cornerRadius: 20)
    }
}

#if DEBUG
struct SecondaryButton_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            SecondaryButton(iconName: "goforward",
                          title: "Actualizar",
                          color: Color.red,
                          action: {})
        }.previewLayout(
            .fixed(width: 400, height: 100)
        ).padding(20)
    }
}
#endif
