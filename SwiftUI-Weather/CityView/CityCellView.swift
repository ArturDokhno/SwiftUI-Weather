//
//  CityView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import SwiftUI

struct CityCellView: View {
    
    let city: City
    
    var body: some View {
        HStack {
            Image(city.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .leading)
                .padding()
            Text(city.name)
        }
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityCellView(city: .init(name: "Vladivostok", imageName: "vladivostok"))
    }
}
