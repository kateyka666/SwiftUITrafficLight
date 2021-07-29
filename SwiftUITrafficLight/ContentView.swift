//
//  ContentView.swift
//  SwiftUITrafficLight
//
//  Created by Екатерина Боровкова on 26.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentColor: ColorSwitchingLogic = .defaultState
    
    @State private var red =  CircleView(color: .red,alpha: alphaIsOff)
    @State private var yellow =  CircleView(color: .yellow, alpha: alphaIsOff)
    @State private var green = CircleView(color: .green, alpha: alphaIsOff)
    
   
    var body: some View {
        ZStack {
            
            let colors = Gradient(colors: [.red, .purple])
            let linearGradient = LinearGradient(gradient: colors, startPoint: .leading, endPoint: .trailing)
            
            Color.black.ignoresSafeArea()
            
            VStack( spacing: 20) {
                
                red
                yellow
                green
                
                Spacer()
                
                Button(action: {
                    choiseColorForLightning()
                }) {
                    Text(
                        currentColor != .defaultState ? "NEXT" : "Start"
                    )
                    .font(.largeTitle).bold()
                }
                .frame(width: 200, height: 100)
                .background(linearGradient)
                .foregroundColor(.white)
                .cornerRadius(30)
            }.padding()
        }
    }

    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

extension ContentView {
    private func choiseColorForLightning(){
        switch currentColor {
        case .defaultState:
            red = CircleView(color: .red,alpha: alphaIsOn)
            currentColor = .red
        case .red:
            red = CircleView(color: .red,alpha: alphaIsOff)
            yellow =  CircleView(color: .yellow, alpha: alphaIsOn)
            currentColor = .orange
        case .orange:
            yellow = CircleView(color: .yellow, alpha: alphaIsOff)
            green = CircleView(color: .green, alpha: alphaIsOn)
            currentColor = .green
        case .green:
            red = CircleView(color: .red,alpha: alphaIsOn)
            green = CircleView(color: .green, alpha: alphaIsOff)
            currentColor = .red
        }
    }
}
