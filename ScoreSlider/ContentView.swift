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
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("O")
                UISliderViewRepresentation(
                    sliderValue: $currentValue,
                    alpha: CGFloat(computeScore())
                )
                Text("100")
            }
            Button("Проверь, меня") {
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
