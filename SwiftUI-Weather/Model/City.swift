//
//  City.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import Foundation

class City: Identifiable {
    internal init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
    
    let name: String
    let imageName: String
}
