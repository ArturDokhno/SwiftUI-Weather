//
//  Lesson2.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 29.01.2022.
//

import SwiftUI

struct Lesson2: View {
    var body: some View {
        VStack {
                morningText
                helloText
                hiText
        }
    }
}

private extension Lesson2 {
    var morningText: some View {
        Text("Good morning")
            .customize()
    }
    var helloText: some View {
        Text("Hello")
            .customize(withColor: .green)
    }
    var hiText: some View {
        Text("Hi")
            .customize()
    }
}

struct CustomViewModifire: ViewModifier {
    var color: Color = .blue
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .background(.yellow)
            .padding(10)
    }
}

extension View {
    func customize(withColor: Color = .red) -> some View {
        self.modifier(CustomViewModifire())
    }
}

struct Lesson2_Previews: PreviewProvider {
    static var previews: some View {
        Lesson2()
    }
}
