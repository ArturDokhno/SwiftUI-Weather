//
//  WeatherView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 30.01.2022.
//

import SwiftUI

struct WeatherView: View {
    var body: some View {
        ZStack {
            Text("Сегодня первое июня")
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                .alignmentGuide(HorizontalAlignment.center, computeValue: { $0[.trailing] })
            Image("sun")
                .resizable()
                .frame(width: 80, height: 80)
                .modifier(CircleShadow(shadowColor: .green, shadowRadius: 3))
                .frame(width: 100, height: 100)
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.bottom] })
                .alignmentGuide(HorizontalAlignment.center, computeValue: { $0[.leading] })
            
            Text("Великолепнейшая погода 25 градусов Цельсия, солнечно, осадков не ожидается")
                .alignmentGuide(VerticalAlignment.center, computeValue: { $0[.top] })
        }
    }
}

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

struct CircleShadow: ViewModifier {
    let shadowColor: Color
    let shadowRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .background(Circle()
                .fill(Color.white)
                .shadow(color: shadowColor, radius: shadowRadius))
    }
}

struct WeatherVIew_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        WeatherView()
    }
}

@resultBuilder
struct StringBuilder {
    static func buildBlock(_ components: String...) -> String {
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
    
    static func buildOptional(_ component: String?) -> String {
        return component ?? ""
    }
    
    static func buildEither(first component: String) -> String {
        return component
    }

    static func buildEither(second component: String) -> String {
        return component
    }
    
    static func buildArray(_ components: [String]) -> String {
        return components.joined(separator: "")
    }
    
    static func buildExpression(_ expression: Int) -> String {
        return "\(expression)"
    }
    
    static func buildExpression(_ expression: String) -> String {
        return expression
    }
}

struct ContentView: View {
    var body: some View {
         Text(
             buildHello(isFormal: true)
         )
             .padding()
     }
     
     @StringBuilder func buildHello(isFormal: Bool) -> String {
         "Hello"
         "world"
         
         if isFormal {
             "Sir"
         } else {
             "man"
         }
     }
 }
