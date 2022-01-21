//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 21.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CustomText(text: "Artur", color: .red)
            CustomText(text: "IOS", color: .green)
            CustomText(text: "Developer", color: .brown)
        }
    }
}

struct CustomText: View {
    @State var text: String
    let color: Color
    var body: some View {
        TextField("Text Field", text: $text)
            .foregroundColor(color)
            .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
