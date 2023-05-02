//
//  ContentView.swift
//  ScoreSlider
//
//  Created by Bektemur Mamashayev on 02/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Float.random(in: 0...100)
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            HStack() {
                Text("Подвиньте слайдер ближе к:")
                Text(targetValue.formatted())
                    .frame(width: 30)
            }
            HStack {
                Text("O")
                UISliderViewRepresentation(
                    sliderValue: $currentValue,
                    alpha: CGFloat(computeScore())
                )
                Text("100")
            }
            
            Button("Проверь меня") {
                isAlertPresented.toggle()
            }
            .alert("Твой результат", isPresented: $isAlertPresented, actions: {}) {
                Text(computeScore().formatted())
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = Float.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
