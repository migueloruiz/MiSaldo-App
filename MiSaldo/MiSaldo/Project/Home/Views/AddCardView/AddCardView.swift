//
//  AddCardView.swift
//  MiSaldo
//
//  Created by Miguel Ruiz on 16/08/19.
//  Copyright © 2019 Chimichanga Studio. All rights reserved.
//

import SwiftUI

struct AddCardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var mapChoioce = 0
    @State private var id: String = ""
    
    var cardsVendors: [CardVendor]
    let onAdd: (String, CardVendor) -> Void
    
    private var selectedVendor: CardVendor {
        return cardsVendors[mapChoioce]
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                EditableCard(vendor: self.selectedVendor,
                             id: $id)
                    .frame(minWidth: 0, maxWidth: .infinity)
                
                Picker("Options", selection: $mapChoioce) {
                    ForEach(0 ..< cardsVendors.count) { index in
                        Text(self.cardsVendors[index].description)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                PrimaryButton(iconName: "", title: "Agregar", color: .gray) {
                    self.onAdd(self.id, self.selectedVendor)
                    self.id = ""
                    self.presentationMode.value.dismiss()
                }
                
                Spacer()
            }
            .padding(20)
            .navigationBarItems(
                trailing: Button(action: {
                    self.presentationMode.value.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .font(Font.callout.weight(.bold))
                        .foregroundColor(.secondary)
                })
            )
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#if DEBUG
struct AddCardView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            AddCardView(cardsVendors: CardVendor.allCases, onAdd: {_,_ in })
                    .environment(\.colorScheme, .light)

            AddCardView(cardsVendors: CardVendor.allCases, onAdd: {_,_ in })
                    .environment(\.colorScheme, .dark)
           }
    }
}
#endif
