//
//  ContentView.swift
//  WeatherApp
//
//  Created by Марк Кулик on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, Color("secondGradientColor")]),
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack {
               Text("Murmansk, Russia")
                    .font(.system(size: 32,weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 10) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    Text("-20°")
                        .font(.system(size: 76,weight: .medium, design: .default))
                        .foregroundColor(.white)
                }
                
                .padding(.bottom, 60)
                
                HStack(spacing: 10) {
                  
                    WeatherDayView(dayOfTheWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: -20)
                    WeatherDayView(dayOfTheWeek: "WED",
                                   imageName: "cloud.fill",
                                   temperature: -15)
                    WeatherDayView(dayOfTheWeek: "THU",
                                   imageName: "snow",
                                   temperature: -11)
                    WeatherDayView(dayOfTheWeek: "FRI",
                                   imageName: "cloud.snow.fill",
                                   temperature: -13)
                    WeatherDayView(dayOfTheWeek: "SAT",
                                   imageName: "thermometer.snowflake",
                                   temperature: -25)
                    WeatherDayView(dayOfTheWeek: "SUN",
                                   imageName: "thermometer.snowflake",
                                   temperature: -28)
                }
                
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .font(.system(size: 20,weight: .medium, design: .default))
                        .foregroundColor(.blue)
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfTheWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 24,weight: .medium, design: .default))
                .foregroundColor(.white)
            
            VStack {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("\(temperature)°")
                    .font(.system(size: 25,weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            
        }
    }
}
