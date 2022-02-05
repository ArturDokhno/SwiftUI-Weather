//
//  LoginView.swift
//  SwiftUI-Weather
//
//  Created by Артур Дохно on 21.01.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    
    @State private var shouldShowLogo: Bool = true
    @State private var showAlert: Bool = false
    
    @Binding var showMainScreen: Bool
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("sunny_weather")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("Weather App ")
                            .font(.largeTitle)
                            .padding(.top, 32)
                    }
                    
                    VStack {
                        HStack {
                            Text("Login:")
                            Spacer()
                            Field(isSecure: false, text: $login)
                        }
                        
                        HStack {
                            Text("Password:")
                            Spacer()
                            Field(isSecure: true, text: $password)
                        }
                        
                    }
                    .frame(maxWidth: 250)
                    .padding(.top, 50)
                    
                    Button(action: { verifyLoginData() }) {
                        Text("Log in")
                    }
                    .padding(.top, 50)
                    .padding(.bottom, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"),
                  message: Text("Incorect data"),
                  dismissButton: .cancel())
        }
    }
    
    private func verifyLoginData() {
        if login == "Bar" && password == "123" {
            showMainScreen = true
        } else {
            showAlert = true
        }
        password = ""
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showMainScreen: .constant(false))
    }
}

struct Field: View {
    let isSecure: Bool
    @Binding var text: String
    
    var body: some View {
        Group {
            if isSecure {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .frame(maxWidth: 150)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .cornerRadius(10.0)
    }
}
