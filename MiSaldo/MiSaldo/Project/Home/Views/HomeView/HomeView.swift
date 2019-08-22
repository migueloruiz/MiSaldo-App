//
//  HomeView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/07/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI
import Combine

struct HomeView: View {

    let actions: HomeActions
    @State private var isAddCardPresented = false
    
    @ObservedObject var state: HomeState
    
    func currentView(for state: HomeState.ViewStateCase) -> AnyView {
        switch state {
        case .displaying(let cards, let selectedCard):
            return AnyView(
                VStack {
                    CardsDetailView(
                    cards: cards,
                    selectedCard: selectedCard) {
                        self.actions.moveNextCardToFront()
                    }
                    Spacer()
                }

            )
        case .empty:
            return AnyView(
                CardsEmptyView()
            )
        }
    }
    
    var body: some View {
        return NavigationView {
            Group {
                currentView(for: self.$state.viewState.value)
                .frame(minHeight: 0, maxHeight: .infinity)
                .padding(20)
            }
            .navigationBarTitle(
                Text("Mi Saldo")
                    .font(.system(.title, design: .rounded))
            )
            .navigationBarItems(trailing:
                Button(action: {
                    self.isAddCardPresented = true
                }, label: {
                    Image(systemName: "plus.circle.fill")
                    .accentColor(Color.secondary)
                    .font(Font.title.weight(.bold))
                })
            ).sheet(isPresented: $isAddCardPresented) {
                AddCardView(cardsVendors: CardVendor.allCases) { (id, vendor) in
                    self.actions.addCard(withID: id, vendor: vendor)
                }
            }
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
            HomeView(
                actions: HomeActions(),
                state: HomeState(initialState: .empty)
            )

            HomeView(
                actions: HomeActions(),
                state: HomeState(initialState: .displaying(
                    cards: Card.previewContent,
                    selectedCard: Card.previewContent[0]
                    )
                )
            )
        }
    }
}
#endif
