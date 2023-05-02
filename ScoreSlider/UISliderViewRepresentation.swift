//
//  UISliderViewRepresentation.swift
//  ScoreSlider
//
//  Created by Bektemur Mamashayev on 02/05/23.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    let alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.thumbTintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = uiView.thumbTintColor?.withAlphaComponent(alpha / 100)
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $sliderValue)
    }
    
    
}
//MARK: - Coordination
extension UISliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(value: Binding<Float>) {
            self._sliderValue = value
        }
        
        @objc func sliderChanged(_ sender: UISlider) {
            sliderValue = Float(sender.value)
        }
    }
}

struct UISliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderViewRepresentation(sliderValue: .constant(50), alpha: 50)
    }
}
