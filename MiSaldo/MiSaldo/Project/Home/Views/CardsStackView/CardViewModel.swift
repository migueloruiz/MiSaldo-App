//
//  CardViewModel.swift
//  DealStack
//
//  Created by Miguel Ruiz on 06/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import SwiftUI

enum CardVendor {
    case bip
    case valpo

    var image: String {
        switch self {
        case .bip: return "bip_logo"
        case .valpo: return "valpo_logo"
        }
    }

    var colorTop: Color {
        switch self {
        case .bip: return Color("bip_top")
        case .valpo: return Color("valpo_top")
        }
    }

    var colorBottom: Color {
        switch self {
        case .bip: return Color("bip_bottom")
        case .valpo: return Color("valpo_bottom")
        }
    }
}

struct Card: Identifiable {
    let id: String
    let order: Int
    let balance: Int
    let vendor: CardVendor
}

#if DEBUG
extension Card {
    static let previewContent: [Card] = [
        Card(
            id: UUID().uuidString,
            order: 0,
            balance: 1000,
            vendor: .bip
        ),
        Card(
            id: UUID().uuidString,
            order: 1,
            balance: 1500,
            vendor: .valpo
        ),
        Card(
            id: UUID().uuidString,
            order: 2,
            balance: 2000,
            vendor: .bip
        ),
        Card(
            id: UUID().uuidString,
            order: 3,
            balance: 500,
            vendor: .valpo
        )
    ]
}
#endif

