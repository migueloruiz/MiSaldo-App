//
//  HomeStore.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import Combine

class HomeStore {
    var state: HomeState
    lazy var actions: HomeActions = HomeActions(delegate: self)
    
    fileprivate var cards: [Card] = []
    fileprivate var selectedCard: Card?

    init() {
        self.state = HomeState(initialState: .empty)
    }
}

extension HomeStore: HomeActionsDelegate {
    
    func loadCards() { }
    
    func moveNextCardToFront() {
        guard cards.count > 1 else {
            updateState()
            return
        }
        let mutableDeal = cards.removeLast()
        cards.insert(mutableDeal, at: 0)
        updateState()
    }
    
    func addCard(withID id: String, vendor: CardVendor) {
        let newCard = Card(id: id,
                           balance: "\(Int.random(in: 0 ..< 5000))",
                           vendor: vendor)
        cards.append(newCard)
        updateState()
    }
}

private extension HomeStore {
    func updateState() {
        if cards.isEmpty {
            state.viewState = .empty
        } else {
            selectedCard = cards.last
            state.viewState = .displaying(cards: cards, selectedCard: selectedCard)
        }
    }
}
