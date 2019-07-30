//
//  CardDetailTopBarView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 20/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardDetailTopBarView : View {
    let title: String
    let action: () -> Void

    var body: some View {
        return HStack {
            Text(title)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .color(.primary)
            Spacer()
            Button(action: action) {
                Image(systemName: "plus.circle.fill")
                    .accentColor(.secondary)
                    .font(Font.title.weight(.bold))
            }
        }
    }
}

#if DEBUG
struct CardDetailTopBarView_Previews : PreviewProvider {
    static var previews: some View {
        CardDetailTopBarView(title: "Title", action: {})
            .previewLayout(.fixed(width: 400, height: 100))
            .padding(20)
    }
}
#endif
