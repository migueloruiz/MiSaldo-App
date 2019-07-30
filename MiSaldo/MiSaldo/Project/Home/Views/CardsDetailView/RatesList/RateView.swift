//
//  RateView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 20/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct RateView : View {

    let rateModel: RateViewModel
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 5)  {
            Text(rateModel.name)
                .font(.headline)
                .fontWeight(.bold)
                .color(color)
            HStack(alignment: .top, spacing: 10) {

                ValuesDescriptionView(title: "Horarios",
                                      values: rateModel.schedule)
                Spacer()
                ValueDescriptionView(title: "Tarifa",
                                     value: rateModel.rate)
            }
        }
        .padding(10)
            .border(color, width: 2, cornerRadius: 8)
    }
}

#if DEBUG
struct RateView_Previews : PreviewProvider {
    static var previews: some View {
        RateView(rateModel: RateViewModel.previewContent[0],
                 color: .gray)
            .padding()
            .previewLayout(.fixed(width: 400, height: 250))
    }
}
#endif
