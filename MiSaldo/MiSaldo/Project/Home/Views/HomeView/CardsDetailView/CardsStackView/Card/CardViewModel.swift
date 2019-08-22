//
//  CardViewModel.swift
//  Mi Saldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

enum CardVendor: CaseIterable {
    case bip
    case valpo
    
    var description: String {
       switch self {
        case .bip: return "Bip!"
        case .valpo: return "Valparaiso"
        }
    }

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
    let balance: String
    let vendor: CardVendor
}

#if DEBUG
extension Card {
    static let previewContent: [Card] = [
        Card(
            id: UUID().uuidString,
            balance: "1000",
            vendor: .bip
        ),
        Card(
            id: UUID().uuidString,
            balance: "1500",
            vendor: .valpo
        ),
        Card(
            id: UUID().uuidString,
            balance: "2000",
            vendor: .bip
        ),
        Card(
            id: UUID().uuidString,
            balance: "500",
            vendor: .valpo
        )
    ]
}
#endif

