//
//  TabBar.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 03.02.2022.
//

import SwiftUI

struct TabBar: View {
    
    @State var selectedButton = 0
    
    var body: some View {
        VStack {
            
            Spacer()
            
            ZStack {
                
                HStack {
                    Button(action: {
                        self.selectedButton = 0
                    }) {
                        Image(systemName: "house")
                    }.foregroundColor(self.selectedButton == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selectedButton = 1
                    }) {
                        Image(systemName: "list.dash")
                    }.foregroundColor(self.selectedButton == 1 ? .black : .gray)
                    
                    Spacer().frame(width: 120)
                    
                    Button(action: {
                        self.selectedButton = 2
                    }) {
                        Image(systemName: "person.2")
                    }.foregroundColor(self.selectedButton == 2 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                    
                    Button(action: {
                        self.selectedButton = 3
                    }) {
                        Image(systemName: "gearshape")
                    }.foregroundColor(self.selectedButton == 3 ? .black : .gray)
                }
                .padding()
                .padding(.horizontal, 22)
                .background(CurvedShape())
                
                Button(action: {
                    //
                }) {
                    Image(systemName: "suit.heart")
                        .foregroundColor(.white)
                        .padding()
                }
                .background(.blue)
                .clipShape(Circle())
                .offset(y: -32)
                .shadow(radius: 5)
            }
        }
        .background(.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}


struct CurvedShape: View {
    var body: some View {
        Path { path in
            
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width,
                                     y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width,
                                     y: 55))
            path.addArc(center: CGPoint(
                x: UIScreen.main.bounds.width/2,
                y: 55),
                        radius: 30,
                        startAngle: .zero,
                        endAngle: .init(degrees: 180),
                        clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 55))
        }
        .fill(.blue)
        .rotationEffect(.init(degrees: 180))
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
