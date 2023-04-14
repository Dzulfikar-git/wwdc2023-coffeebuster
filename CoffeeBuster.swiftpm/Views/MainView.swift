import SwiftUI
import CoreData

struct MainView: View {
    @AppStorage("CoffeeList") var coffeeList: String = ""
    @AppStorage("CoffeeHistory") var coffeeHistory: String = ""
    var body: some View {
        TabView {
            RandomizerScreenView()
                .tabItem {
                    Label("Randomizer", systemImage: "cup.and.saucer.fill")
                }
            HistoryScreenView(coffeeHistory: JsonUtil.parseJsonCoffeeHistory(jsonData: coffeeHistory.data(using: .utf8)!))
                .tabItem {
                    Label("History", systemImage: "list.bullet.rectangle.fill")
                }
        }
        .onAppear {
            if coffeeList.isEmpty {
                initializeData()
            }
        }
    }
    
    private func initializeData() {
        if coffeeList.isEmpty {
            coffeeList = Coffee.coffeeJson
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
