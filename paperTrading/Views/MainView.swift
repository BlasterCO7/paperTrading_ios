//
//  HomeView.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @Binding  var isUserLoggedIn :Bool
    @State private var searchText = ""
    @State private var selectedTab = 0
    var body: some View {
        VStack {
            HStack{
                Image(systemName:"person.fill")
                    .frame(width: 30,height: 30)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(15)
                    .padding()
                SearchBarView(searchText: $searchText, placeholder: placeholderForTab(selectedTab))
                Button(action:{
                    signOut()
                }){
                    Image(systemName: "arrowshape.left.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            
            TabView(selection: $selectedTab){
                NavigationView{
                    HomeView()
                }
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(0)
                NavigationView{
                    PortfolioView()
                }
                .tabItem {
                    Label("Portfolio", systemImage: "briefcase")
                }
                .tag(1)
                NavigationView {
                 
                        NewsView()
                    
                    
                              
                }
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
                .tag(2)
                NavigationView {
                    MoreView()
                }
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
                .tag(3)
            }
        }
      
    }
    private func placeholderForTab(_ selectedTab: Int) -> String {
            switch selectedTab {
            case 0: return "Search Stocks"
            case 1: return "Search Portfolio"
            case 2: return "Search News"
            case 3: return "Search More"
            default: return "Search"
            }
        }
        func signOut() {
            do {
                try Auth.auth().signOut()  // Firebase Sign Out
                isUserLoggedIn = false
                
            } catch {
                print("Error signing out: \(error.localizedDescription)")
            }
        }
}
//#Preview {
//    MainView(isUserLoggedIn: .constant(true))
//}
