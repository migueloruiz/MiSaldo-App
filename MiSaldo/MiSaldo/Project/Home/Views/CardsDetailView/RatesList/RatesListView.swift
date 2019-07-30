//
//  RatesListView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 20/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct RatesListView : View {

    let rates: [RateViewModel]
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Tarifario")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                Spacer()
            }

            ForEach(rates) { rate in
                RateView(rateModel: rate,
                         color: self.color)
            }
        }

    }
}

#if DEBUG
struct RatesListView_Previews : PreviewProvider {
    static var previews: some View {
        RatesListView(rates: RateViewModel.previewContent,
                      color: .blue)
            .padding()
            .previewLayout(.fixed(width: 400, height: 700))
    }
}
#endif
