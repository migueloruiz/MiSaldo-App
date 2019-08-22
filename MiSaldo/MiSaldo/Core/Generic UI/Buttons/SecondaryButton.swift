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
                    .foregroundColor(color)
                    .font(.callout)
                    .fontWeight(.bold)

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
                .environment(\.colorScheme, .light)

             SecondaryButton(iconName: "goforward",
             title: "Actualizar",
             color: Color.red,
             action: {})
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 200, height: 100))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBackground)
    }
}
#endif
