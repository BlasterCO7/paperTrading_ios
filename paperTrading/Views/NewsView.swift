//
//  NewsView.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import SwiftUI
//struct NewsItem: Decodable, Identifiable {
//    var id: String { uuid } // Conforming to Identifiable
//    let uuid: String
//    let source: String
//    let snippet: String
//}
//
//struct ApiResponse: Decodable {
//    let data: [NewsItem]
//}


struct NewsView: View {
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                MovingBar()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                
                HStack{
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 70, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(Color.black,lineWidth: 3)
                            
                        }
                        .overlay(
                            Text("All")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        )
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 120, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(Color.black,lineWidth: 3)
                            
                        }
                        .overlay(
                            Text("My portfolio news")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        )
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 140, height: 50)
                        .overlay{
                            Capsule()
                                .stroke(Color.black,lineWidth: 3)
                            
                        }
                        .overlay(
                            Text("My waitlist news")
                                .font(.system(size: 12))
                                .foregroundColor(.black)
                        )
                    
                }
                
                
            
                
            }
            
            VStack{
                ScrollView{
                    NewsListView()
                }
                
            }

            
               
            
            
            
            
        }
        
    }
}

#Preview {
    NewsView()
}
