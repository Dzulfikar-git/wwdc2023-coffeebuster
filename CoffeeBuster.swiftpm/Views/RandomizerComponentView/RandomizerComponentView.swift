//
//  RandomizerComponentView.swift
//  CoffeeRandomizer
//
//  Created by Dzulfikar on 10/04/23.
//

import SwiftUI

struct RandomizerComponentView: View {
    @AppStorage("CoffeeHistory") var coffeeHistoryUserDefault: String = ""
    
    private let images = ["Cup1", "Cup2", "Cup3", "Cup4", "Cup5", "Cup6", "Cup7", "Cup8"]
    @Binding var data: [Coffee]
    @Binding var selectedRandomCoffees: [Coffee]
    @Binding var isRandomizing: Bool
    @Binding var isPresentingCoffeeList: Bool
    
    @State private var coffeeHistory: CoffeeHistory = .init()
    
    @State private var randomNumber = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(images[randomNumber])
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: UIDevice.isIPhone ? 250.0 : 500.0)
                
            Text("Selected Coffees: \(data.count)")
                .font(.system(size: UIDevice.isIPhone ? 24.0 : 32.0))
                .padding([.top], 16.0)
            Spacer()
            
            
            Button(action: {
                if data.isEmpty || data.count == 1 {
                    isPresentingCoffeeList = true
                } else if isRandomizing {
                    return
                } else {
                    randomize()
                }
            }, label: {
                Text("Randomize")
                    .font(.system(size: UIDevice.isIPhone ? 16.0 : 24.0))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
            })
            .padding([.vertical], UIDevice.isIPhone ? 12.0 : 24.0)
            .background(RoundedRectangle(cornerRadius: 8.0).fill(isRandomizing || data.isEmpty ? Color.gray : Color.blue))
            .foregroundColor(.white)
            .padding([.horizontal], UIDevice.isIPhone ? 32.0 : 64.0)
            Spacer()
        }
        .onAppear {
            if coffeeHistoryUserDefault.isEmpty {
                print("Coffee History Empty")
            } else {
                coffeeHistory = JsonUtil.parseJsonCoffeeHistory(jsonData: coffeeHistoryUserDefault.data(using: .utf8)!)
                print("Data Decoded!")
            }
        }
    }
    
    private func randomize() {
        self.isRandomizing = true
        self.selectedRandomCoffees.removeAll()
        let duration: Double = 3
        var stepDuration: Double = 0.1
        let steps = Int(duration / stepDuration)
        var step = 1
        self.timer = Timer.scheduledTimer(withTimeInterval: stepDuration, repeats: true) { _ in
            self.randomNumber = (self.randomNumber + 1) % self.images.count
            if step < steps {
                let progress = Double(step) / Double(steps)
                let easedDuration = duration - (duration * progress * progress)
                stepDuration = easedDuration / Double(steps - step)
            }
            let randomValue = self.data.randomElement()!
            self.selectedRandomCoffees.append(randomValue)
            step += 1
            if step > steps {
                self.timer?.invalidate()
                self.timer = nil
                self.isRandomizing = false
                let result = self.selectedRandomCoffees.last!
                addToHistory(coffee: result)
                let alert = UIAlertController(title: "Randomizer Result", message: "The result is `\(result.name)`", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Again", style: .destructive, handler: { _ in
                    randomize()
                }))
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func addToHistory(coffee: Coffee) {
        coffeeHistory.addCoffee(coffee, for: try! Date(Date.now.formatted(date: .abbreviated, time: .omitted), strategy: Date.FormatStyle().month().year().day()))
        
        // save to user default.
        coffeeHistoryUserDefault = JsonUtil.encodeCoffeeHistory(data: coffeeHistory)
        
    }
}

struct RandomizerComponentView_Previews: PreviewProvider {
    struct RandomizerComponentViewPreviewer: View {
        @State var data: [Coffee] = JsonUtil.parseJsonCoffeeElement(jsonData: Coffee.coffeeJson.data(using: .utf8)!)
        @State var selectedData: [Coffee] = []
        @State var isRandomizing: Bool = false
        
        
        var body: some View {
            RandomizerComponentView(data: $data, selectedRandomCoffees: $selectedData, isRandomizing: $isRandomizing, isPresentingCoffeeList: .constant(false))
        }
    }
    
    static var previews: some View {
        RandomizerComponentViewPreviewer()
    }
}
