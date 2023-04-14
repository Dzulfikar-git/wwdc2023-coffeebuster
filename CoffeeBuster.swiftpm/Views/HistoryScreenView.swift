//
//  HistoryScreenView.swift
//  CoffeeRandomizer
//
//  Created by Dzulfikar on 10/04/23.
//

import SwiftUI

struct HistoryScreenView: View {
    let coffeeHistory: CoffeeHistory
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                HistoryScreenComponentView(coffeeHistory: coffeeHistory)
            }
        } else {
            NavigationView {
                HistoryScreenComponentView(coffeeHistory: coffeeHistory)
            }
        }
        
    }
}

struct HistoryScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        var coffeeHistory: CoffeeHistory = .init()
        var addData = coffeeHistory.addCoffee(Coffee(id: 1, name: "asd"), for: Date.now)
        var getData = coffeeHistory.getCoffeeItems(for: Date.now)
        HistoryScreenView(coffeeHistory: coffeeHistory)
    }
}


struct HistoryScreenComponentView: View {
    let coffeeHistory: CoffeeHistory
    var body: some View {
        VStack(alignment: .center) {
            if coffeeHistory.history.isEmpty {
                Group {
                    Text("Oops, You haven't had any coffee yet.")
                        .font(.system(size: 16.0, weight: .bold))
                    Text("Start Randomize ☕️")
                        .font(.system(size: 24.0, weight: .bold))
                }.padding([.bottom], 2)
            } else {
                List {
                    ForEach(coffeeHistory.history.keys.sorted(), id: \.self) { date in
                        Section(header: Text(date.formatted(date: .abbreviated, time: .omitted))) {
                            ForEach(coffeeHistory.getCoffeeItems(for: date), id: \.id) { coffeeItem in
                                Text(coffeeItem.name)
                            }
                        }
                    }
                }
            }
        }
        
        .navigationTitle("Coffee History")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("PrimaryColor"))
    }
}
