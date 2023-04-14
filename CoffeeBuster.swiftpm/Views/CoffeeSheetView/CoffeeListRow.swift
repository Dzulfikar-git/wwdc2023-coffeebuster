//
//  SwiftUIView.swift
//  
//
//  Created by Dzulfikar on 07/04/23.
//

import SwiftUI

struct CoffeeListRow: View {
    var data: Coffee
    @Binding var selectedCoffees: [Coffee]
    var buttonAction: () -> Void
    var body: some View {
        HStack(alignment: .top) {
            Button(action: buttonAction) {
                HStack {
                    if selectedCoffees.contains(data) {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .animation(.easeIn, value: 0.5)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.primary)
                            .animation(.easeOut, value: 0.5)
                    }
                    Text(data.name)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .buttonStyle(BorderlessButtonStyle())
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct CoffeeListRow_Previews: PreviewProvider {
    struct CoffeeListRowPreviewer: View {
        @State private var selectedCoffees: [Coffee] = []
        var body: some View {
            CoffeeListRow(data: Coffee(id: 1, name: "Caramel Ribbon Crunch Frappuccino Blended Beverage"), selectedCoffees: $selectedCoffees, buttonAction: {
                print("ASD")
            })
        }
    }
    
    static var previews: some View {
        CoffeeListRowPreviewer()
    }
}
