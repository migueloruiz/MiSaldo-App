//
//  HomeState.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

class HomeState: BindableObject {
    enum ViewStateCase {
        case loading
        case displaying(cards: [Card], selectedCard: Card?)
        case empty
    }

    let didChange = PassthroughSubject<HomeState, Never>()

    var viewState: ViewStateCase {
        didSet {
            DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.didChange.send(strongSelf)
            }
        }
    }

    init(initialState: HomeState.ViewStateCase) {
        self.viewState = initialState
    }

}
