//
//  CardsEmptyView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct CardsEmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "creditcard")

            Text("Aun no tienes tarjetas")
                .font(.title)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .lineLimit(nil)
        }
        .padding(20)
    }
}

#if DEBUG
struct CardsEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CardsEmptyView()
    }
}
#endif
