//
//  CardIDLabelView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 17/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardIDLabelView : View {

    let value: String

    var body: some View {
        return Text(self.value)
            .color(.gray)
            .font(.body)
            .fontWeight(.bold)
            .frame(minWidth: 0)
            .padding(10)
            .background(Color.white)
            .cornerRadius(20)
    }
}

#if DEBUG
struct CardIDLabelView_Previews : PreviewProvider {
    static var previews: some View {
        Group{
            CardIDLabelView(value: "3453245-325-3425-3245")
        }
        .previewLayout(
            .fixed(width: 300, height: 100)
        )
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
    }
}
#endif
