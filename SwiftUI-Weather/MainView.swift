//
//  MainView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 01.02.2022.
//

import SwiftUI

struct MainView: View {
    
    @State var showMainScreen: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(showMainScreen: $showMainScreen)
                NavigationLink(isActive: $showMainScreen) {
                    CitiesView()
                } label: {
                    EmptyView()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
