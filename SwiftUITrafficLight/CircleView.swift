//
//  CircleView.swift
//  SwiftUITrafficLight
//
//  Created by Екатерина Боровкова on 26.07.2021.
//

import SwiftUI

struct CircleView: View {
    var color: Color
    var alpha: Double
    var body: some View {
        
        let colors = Gradient(colors: [.red, .green, .blue])
//        созаем радиальный градиент
        let radialGradien = RadialGradient(gradient: colors, center: .center, startRadius: 5, endRadius: 100)
        
        Circle()
            .fill(color)
            .frame(width: 150, height: 150)
//            оверлай накладывает еще один объект поверх объекта, строук обводит контур объекта цветом или градиентом
            .overlay(Capsule().stroke(radialGradien, lineWidth: 8))
            .opacity(alpha)
            .shadow(color: .white, radius: 30)
            
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .green,alpha: 0.3)
    }
}
