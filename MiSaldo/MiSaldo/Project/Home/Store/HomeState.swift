//
//  HomeState.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import Combine

class HomeState: ObservableObject {
    @Published var viewState: ViewStateCase
    
    enum ViewStateCase {
        case displaying(cards: [Card], selectedCard: Card?)
        case empty
    }

    init(initialState: HomeState.ViewStateCase) {
        self.viewState = initialState
    }
}
