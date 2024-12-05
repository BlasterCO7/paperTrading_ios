//
//  LoginView.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import SwiftUI
import FirebaseAuth
import LocalAuthentication

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isFaceIDAuthenticated = false
    @State private var showHomeScreen = false
    @Binding var isUserLoggedIn: Bool
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("PupStocks")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                Text("Login")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()

                TextField("Email", text: $email)
                    .frame(width:320,height: 30)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .frame(width:320,height: 30)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)

                Button("Login") {
                    login()
                }
                .frame(width:120,height: 50)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(15)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                NavigationLink(
                    destination: MainView(isUserLoggedIn: $isUserLoggedIn),
                    isActive: $showHomeScreen,
                    label: { EmptyView() }
                )
            }
            .padding()
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
                authenticateWithFaceID()
            }
        }
    }

    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Authenticate with Face ID") { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        showHomeScreen = true
                    } else {
                        errorMessage = "Face ID authentication failed."
                    }
                }
            }
        } else {
            errorMessage = "Face ID not available."
        }
    }
}

//#Preview {
//    LoginView(isUserLoggedIn: .constant(false))
//}
