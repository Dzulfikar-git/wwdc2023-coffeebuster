//
//  RandomizerScreenView.swift
//  CoffeeRandomizer
//
//  Created by Dzulfikar on 10/04/23.
//

import SwiftUI

struct RandomizerScreenView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                RandomizerContentView()
            }
        } else {
            NavigationView {
                RandomizerContentView()
            }
        }
    }
}

struct RandomizerScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RandomizerScreenView()
    }
}

struct RandomizerContentView: View {
    @Environment(\.presentationMode) var presentation
    @State private var isPresentingCoffeeList: Bool = false
    @State private var coffeeData: [Coffee] = JsonUtil.parseJsonCoffeeElement(jsonData: Coffee.coffeeJson.data(using: .utf8)!)
    @State private var selectedCoffees: [Coffee] = []
    @State private var selectedRandomCoffees: [Coffee] = []
    @State private var isRandomizing: Bool = false
    var body: some View {
        VStack {
            RandomizerComponentView(data: $selectedCoffees, selectedRandomCoffees: $selectedRandomCoffees, isRandomizing: $isRandomizing, isPresentingCoffeeList: $isPresentingCoffeeList)
        }
        .toolbar {
            ToolbarItem(placement: .principal, content: {
                Text("Coffee Buster")
                    .font(.title3)
                    .fontWeight(.bold)
            })
            ToolbarItem(placement: .primaryAction, content: {
                Button {
                    isPresentingCoffeeList.toggle()
                } label: {
                    Image(systemName: "plus")
                }.frame(height: 96, alignment: .trailing) // a hack in order for primary action to be clickable after sheet is closed.
            })
            ToolbarItem(placement: .cancellationAction, content: {
                Button {
                    selectedCoffees = []
                } label: {
                    Text("Reset")
                }
                .frame(height: 96, alignment: .trailing)
                .disabled(isRandomizing)
            })
        }
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isPresentingCoffeeList, content: {
            CoffeeListView(coffeeData: $coffeeData, selectedCoffees: $selectedCoffees)
        })
        .background(Color("PrimaryColor"))
    }
}
