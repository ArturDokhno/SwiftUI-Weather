//
//  ForecastView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import SwiftUI

struct ForecastView: View {
    let city: City
    let weathers = [
        Weather(temperature: 15.0, date: Date(), icon: ""),
        Weather(temperature: 16.0, date: Date(), icon: ""),
        Weather(temperature: 16.0, date: Date(), icon: ""),
        Weather(temperature: 16.0, date: Date(), icon: "")
    ]
    
    var body: some View {
        List(weathers) { weather in
            WeatherView(weather: weather)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(city: City(name: "Kazan", imageName: "kazan"))
    }
}
