//
//  RateViewModel.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 20/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct RateViewModel: Identifiable {
    let name: String
    let rate: String
    let schedule: [String]

    var id: String { return name + rate }
}

#if DEBUG
extension RateViewModel {
    static let previewContent: [RateViewModel] = [
        RateViewModel(name: "Punta",
                      rate: "$800",
                      schedule: ["07:00 - 08:59", "18:00 - 19:59"]),
        RateViewModel(name: "Valle",
                      rate: "$720",
                      schedule: ["06:30 - 06:59", "09:00 - 17:59", "20:00 - 20:44"]),
        RateViewModel(name: "Bajo",
                      rate: "$670",
                      schedule: ["06:00 - 06:29", "20:45 - 23:00"]),
        RateViewModel(name: "Fin de Seman y Festivo",
                      rate: "$720",
                      schedule: ["06:30 - 23:00"]),
    ]

}
#endif
