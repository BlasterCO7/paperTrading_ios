//
//  SearchBarView.swift
//  paperTrading
//
//  Created by Piyush Anand on 23/11/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var placeholder: String
    var body: some View {
        HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField(placeholder, text: $searchText)
                        .padding(7)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(10)
//                .shadow(radius: 5)
    }
}

//#Preview {
//    SearchBarView(searchText: .constant("TATA"), placeholder: "Search for stocks")
//}
