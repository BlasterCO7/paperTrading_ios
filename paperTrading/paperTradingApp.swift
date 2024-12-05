//
//  paperTradingApp.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import SwiftUI
import Firebase

@main
struct paperTradingApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
//            MainView(isUserLoggedIn: .constant(true))
        }
    }
}
