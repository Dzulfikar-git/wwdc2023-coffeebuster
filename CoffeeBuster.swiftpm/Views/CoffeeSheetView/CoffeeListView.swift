//
//  CoffeeListView.swift
//  CoffeeSpinner
//
//  Created by Dzulfikar on 07/04/23.
//

import SwiftUI

struct CoffeeListView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var search: String = ""
    @Binding var coffeeData: [Coffee]
    @Binding var selectedCoffees: [Coffee]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(coffeeData, id: \.id) { coffee in
                        CoffeeListRow(data: coffee, selectedCoffees: $selectedCoffees, buttonAction: {
                            if selectedCoffees.contains(where: {$0 == coffee}) {
                                selectedCoffees.remove(at: selectedCoffees.firstIndex(of: coffee) ?? 0)
                            } else {
                                selectedCoffees.append(coffee)
                            }
                        })
                    }.padding([.vertical], 4.0)
                }
                .padding([.horizontal], 16.0)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        Button {
                            if selectedCoffees.count == coffeeData.count {
                                selectedCoffees = []
                            } else {
                                selectedCoffees = coffeeData
                            }
                        } label: {
                            Text(selectedCoffees.count == coffeeData.count ? "Unselect All" : "Select All")
                        }
                    })
                    
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button {
                            dismiss()
                        } label: {
                            Text("Done")
                        }
                    })
                }
                .searchable(text: $search)
                .onChange(of: search) { _ in
                    filterData()
                }
                .onSubmit(of: .search, {
                    filterData()
                })
                
                .navigationTitle("Coffee List")
            }
        }
    }
    
    private func filterData() {
        if search.isEmpty {
            coffeeData = JsonUtil.parseJsonCoffeeElement(jsonData: Coffee.coffeeJson.data(using: .utf8)!)
        } else {
            coffeeData = JsonUtil.parseJsonCoffeeElement(jsonData: Coffee.coffeeJson.data(using: .utf8)!).filter({
                $0.name.localizedCaseInsensitiveContains(search)
            })
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    struct CoffeListViewPreviewer: View {
        @State private var coffeeData: [Coffee] = JsonUtil.parseJsonCoffeeElement(jsonData: Coffee.coffeeJson.data(using: .utf8)!)
        @State private var selectedCoffees: [Coffee] = []
        var body: some View {
            CoffeeListView(coffeeData: $coffeeData, selectedCoffees: $selectedCoffees)
        }
    }
    
    static var previews: some View {
        CoffeListViewPreviewer()
    }
}
