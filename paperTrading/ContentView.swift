//
//  ContentView.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State private var isSignUpView = false
    @State private var isUserLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                if isUserLoggedIn {
                    
                    MainView(isUserLoggedIn: $isUserLoggedIn)
                } else {
                    if isSignUpView {
                        
                        SignUpView()
                    } else {
                        
                        LoginView(isUserLoggedIn: $isUserLoggedIn)
                    }
                    Button(action: {
                        isSignUpView.toggle()
                    }) {
                        Text(isSignUpView ? "Already have an account? Log In" : "Don't have an account? Sign Up")
                            .foregroundColor(.blue)
                            .padding(.top, 20)
                    }
                }
            }
            .onAppear {
                checkUserAuthenticationStatus()
            }
        }
    }
    
    func checkUserAuthenticationStatus() {
        if Auth.auth().currentUser != nil {
            isUserLoggedIn = true
        } else {
            isUserLoggedIn = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
