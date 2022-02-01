//
//  CitiesView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import SwiftUI

struct CitiesView: View {
    
    private let cities: [City] = [
    City(name: "Kazan", imageName: "kazan"),
    City(name: "Surgut", imageName: "surgut"),
    City(name: "Moscov", imageName: "moscov"),
    City(name: "Vladivostok", imageName: "vladivostok")
    ]
    
    var body: some View {
        List(cities) { city in
            NavigationLink {
                ForecastView(city: city)
            } label: {
                CityCellView(city: city)
            }
        }
        .navigationTitle("Cities")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView()
    }
}
