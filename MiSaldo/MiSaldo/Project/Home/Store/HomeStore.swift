//
//  HomeStore.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

class HomeStore {
    var state: HomeState
    lazy var actions: HomeActions = HomeActions(delegate: self)

    fileprivate var cards: [Card] = []
    fileprivate var selectedCard: Card?

    init() {
        self.state = HomeState(initialState: .loading)
    }
}

extension HomeStore: HomeActionsDelegate {
    func loadCards() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.cards = Card.previewContent
            self.selectedCard = self.cards.first
            self.state.viewState = .displaying(cards: self.cards, selectedCard: self.selectedCard)
        }
    }

    func moveNextCardToFront() {
        let mutableDeal = cards.removeLast()
        selectedCard = mutableDeal
        cards.insert(mutableDeal, at: 0)
        state.viewState = .displaying(cards: cards, selectedCard: selectedCard)
    }

}
