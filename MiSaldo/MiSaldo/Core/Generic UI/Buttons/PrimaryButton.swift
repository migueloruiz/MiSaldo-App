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
                    .foregroundColor(.white)
                    .font(.callout)
                    .fontWeight(.bold)
                Spacer()
            }
        }
        .padding(10)
            .background(color)
            .cornerRadius(20)
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#if DEBUG
struct PrymaryButton_Previews : PreviewProvider {
    static var previews: some View {
        Group {
             PrimaryButton(iconName: "goforward",
                                     title: "Actualizar",
                                     color: .red,
                                     action: {})
                .environment(\.colorScheme, .light)

             PrimaryButton(iconName: "goforward",
                                     title: "Actualizar",
                                     color: .red,
                                     action: {})
                .environment(\.colorScheme, .dark)
        }
        .previewLayout(.fixed(width: 200, height: 100))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBackground)
        
    }
}
#endif
