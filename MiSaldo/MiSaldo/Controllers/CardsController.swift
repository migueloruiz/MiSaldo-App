//
//  CardsController.swift
//  DealStack
//
//  Created by Miguel Ruiz on 06/07/19.
//  Copyright © 2019 Guilherme Rambo. All rights reserved.
//

import Combine
import SwiftUI

protocol CardsController: BindableObject {
    var cards: [Card] { get }
    func nextCardToFront()
    func index(for card: Card) -> Int
}

class CardsControllerImpl: CardsController {

    var didChange = PassthroughSubject<Void, Never>()

    private(set) var cards: [Card] {
        didSet {
            didChange.send(())
        }
    }

    private(set) var slectedCard: Card?


    init(cards: [Card] = []) {
        self.cards = cards
        self.slectedCard = cards.last
    }

    func index(for card: Card) -> Int {
        return cards.firstIndex(where: { $0.id == card.id })!
    }

    func nextCardToFront() {
        print(cards.map{ "\($0.balance)" }.joined(separator: ","))
        let mutableDeal = cards.removeLast()
        slectedCard = mutableDeal
        cards.insert(mutableDeal, at: 0)
        print(slectedCard?.balance)
    }
}
