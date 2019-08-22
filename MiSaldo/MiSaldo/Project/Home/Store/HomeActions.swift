//
//  HomeActions.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import Foundation

protocol HomeActionsDelegate: class {
    func loadCards()
    func moveNextCardToFront()
    func addCard(withID id: String, vendor: CardVendor)
}

class HomeActions: HomeActionsDelegate {
    weak var delegate: HomeActionsDelegate?

    init(delegate: HomeActionsDelegate? = nil) {
        self.delegate = delegate
    }

    func loadCards() {
        delegate?.loadCards()
    }
    func moveNextCardToFront() {
        delegate?.moveNextCardToFront()
    }
    
    func addCard(withID id: String, vendor: CardVendor) {
        delegate?.addCard(withID: id, vendor: vendor)
    }
}
