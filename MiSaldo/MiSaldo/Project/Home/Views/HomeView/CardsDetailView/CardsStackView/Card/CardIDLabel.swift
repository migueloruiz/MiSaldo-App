//
//  CardIDLabelView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 17/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardIDLabel : View {
    let value: String

    var body: some View {
        return Text(self.value)
            .foregroundColor(.secondary)
            .fontWeight(.bold)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(10)
            .background(Color.primaryBackground)
            .cornerRadius(20)
            .lineLimit(1)
    }
}

#if DEBUG
struct CardIDLabelView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            CardIDLabel(value: "3453245-325-3425-3245")
            .environment(\.colorScheme, .light)
            
            CardIDLabel(value: "3453245-32")
            .environment(\.colorScheme, .dark)
        }
        .previewLayout(
            .fixed(width: 300, height: 100)
        )
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
#endif
