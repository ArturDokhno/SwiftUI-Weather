//
//  Weather.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import Foundation

class Weather: Identifiable {
   internal init(temperature: Double, date: Date, icon: String) {
       self.temperature = temperature
       self.date = date
       self.iconName = icon
   }
  
   let id: UUID = UUID()
   let temperature: Double
   let date: Date
   let iconName: String
}
