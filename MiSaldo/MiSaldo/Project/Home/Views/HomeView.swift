//
//  HomeView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView : View {

    private struct Constants {
        static let cardsVerticalOffset: Float = 20
        static let cardsScaleOffset: Float = 0.2
    }

    let actions: HomeActions
    @ObjectBinding var state: HomeState


    var currentView: AnyView {
        switch self.state.viewState {
        case .loading:
            return AnyView(Text("loading"))
        case .displaying(let cards, let selectedCard):
            return AnyView(CardsDetailView(cards: cards, selectedCard: selectedCard) {
                self.actions.moveNextCardToFront()
            })
        case .empty:
            return AnyView(Text("empty"))
        }
    }

    var body: some View {
        ScrollView {
            currentView
        }
        .onAppear {
            self.actions.loadCards()
        }
    }

}

#if DEBUG
struct HomeView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(actions: HomeActions(), state: HomeState(initialState: .loading))

            HomeView(actions: HomeActions(),
                     state: HomeState(
                        initialState: .displaying(
                            cards: Card.previewContent,
                            selectedCard: Card.previewContent[0]
                        )
                    )
            )

            HomeView(actions: HomeActions(), state: HomeState(initialState: .empty))
        }
    }
}
#endif

