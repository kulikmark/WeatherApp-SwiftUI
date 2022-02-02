//
//  ContentView.swift
//  WeatherApp
//
//  Created by Марк Кулик on 01.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack {
            CityTextView(cityName: "Murmansk, Russia")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: -20)
                
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
                    
                    isNight.toggle()
                    
                } label: {
                    isNight ? WeatherButton(buttonText: "Change Day Time",
                                        buttonForegroundColor: .white,
                                            buttonBackgroungColor: .black) :
                    WeatherButton(buttonText: "Change Day Time",
                                        buttonForegroundColor: .blue,
                                            buttonBackgroungColor: .white)
                    
                
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

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color  ("secondGradientColor")]),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
           Text(cityName)
                .font(.system(size: 32,weight: .medium, design: .default))
                .foregroundColor(.white)
                .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 76,weight: .medium, design: .default))
                .foregroundColor(.white)
        }
        
        .padding(.bottom, 60)
    }
}

