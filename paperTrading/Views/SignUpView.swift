//
//  SignUpView.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import SwiftUI
import FirebaseAuth
import LocalAuthentication

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var showFaceIDSetup = false

    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack(spacing: 20) {
                Text("PupStocks")
                    .foregroundColor(.white)
                    .bold()
                    .font(.system(size: 50))
                Text("Sign Up")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .frame(width:320,height: 40)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .frame(width:320,height: 40)
                    .foregroundColor(.black)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)


                Button("Sign Up") {
                    signUp()
                }
                .frame(width:120,height: 50)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(15)
                
                

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            
            .padding()
            .alert(isPresented: $showFaceIDSetup) {
                Alert(
                    title: Text("Set Up Face ID"),
                    message: Text("You need to enable Face ID for additional security."),
                    dismissButton: .default(Text("OK"), action: saveCredentialsForFaceID)
                )
            }
        }
        
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
                showFaceIDSetup = true
            }
        }
    }

    func saveCredentialsForFaceID() {
        KeychainHelper.shared.save("email", value: email)
        KeychainHelper.shared.save("password", value: password)
        print("Credentials saved for Face ID!")
    }
}

#Preview {
    SignUpView()
}
