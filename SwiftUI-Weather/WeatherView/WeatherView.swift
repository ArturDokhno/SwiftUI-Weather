//
//  WeatherViev.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import SwiftUI

struct WeatherView: View {
    
    let weather: Weather
    
    var body: some View {
        HStack {
            Image("sun")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .leading)
                .padding()
            Text(String(weather.temperature))
        }
    }
}

struct WeatherViev_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: Weather.init(temperature: 15.0, date: Date(), icon: ""))
    }
}
