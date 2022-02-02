//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Марк Кулик on 02.02.2022.
//

import SwiftUI

struct WeatherButton: View {
 
    var buttonText: String
    var buttonForegroundColor: Color
    var buttonBackgroungColor: Color
    
    var body: some View {

        Text(buttonText)
            .font(.system(size: 20,weight: .medium, design: .default))
            .foregroundColor(buttonForegroundColor)
            .frame(width: 280, height: 50)
            .background(buttonBackgroungColor)
            .cornerRadius(10)
    }
}

