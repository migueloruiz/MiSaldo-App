//
//  PrymaryButton.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 17/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct PrimaryButton : View {

    let iconName: String
    let title: String
    let color: Color?
    let action: () -> Void

    var body: some View {
        return Button(action: action) {
            HStack(alignment: .lastTextBaseline) {
                Spacer()
                Image(systemName: iconName)
                    .accentColor(.white)
                    .font(Font.callout.weight(.bold))
                Text(title)
                    .font(.callout)
                    .fontWeight(.bold)
                    .color(.white)
                Spacer()
            }
        }
        .padding(10)
            .background(color)
            .cornerRadius(20)
            .frame(minWidth: 0, maxWidth: .infinity)
            .animation(Animation.basic(duration: 0.3, curve: .easeInOut))
    }
}

#if DEBUG
struct PrymaryButton_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            PrimaryButton(iconName: "goforward",
                          title: "Actualizar",
                          color: Color.red,
                          action: {})
        }.previewLayout(
            .fixed(width: 400, height: 100)
        ).padding(20)    }
}
#endif
