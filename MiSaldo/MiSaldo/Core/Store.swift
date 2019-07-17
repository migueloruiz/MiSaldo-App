//
//  BaseStore.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

class Store<StateModel: ViewState, ActionsModel: ViewActions>: BindableObject {

    private(set) var actions: ActionsModel

    internal let didChange = PassthroughSubject<StateModel, Never>()

    internal var state: StateModel {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self.state)
            }
        }
    }

    init(state: StateModel, actions: ActionsModel) {
        self.state = state
        self.actions = actions
    }
}
