//
//  MoreView.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import SwiftUI

struct MoreView:View {
    var portfolioList=["Fixed Deposits","Gold","IPOs","NCDs & Bonds"]
    var InsuranceList=["Life","Motor","My policies"]
    var Quicklinks=["Switch to F&O","Youtube","Telegram","Twitter","Instagram"]
    @State private var searchText=""
    var body: some View {
        VStack{
//            SearchBarView(searchText: $searchText, placeholder: "Seach Stocks")
            ScrollView{
                VStack(alignment:.leading){
                    Text("Diversify your portfolio")
                        .font(.title)
                        .bold()
                        
                    Text("Investments beyond just Stocks & Mutual ")
                        .font(.callout)
                    
                    
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                ForEach(portfolioList,id:\.self){
                                    investment in
                                    
                                    VStack{
                                        Image(systemName: "person.fill")
                                            .frame(width: 40,height: 40)
                                            .background(Color.purple.opacity(0.2))
                                            .cornerRadius(20)
                                        Text(investment)
                                    }
                                    .padding()
                                    
                                }
                            }
                            
                        }
                    
                }
                .frame(maxWidth:.infinity)
                //Diversify your portfolio
                    .padding()
                Divider()
                
                // Insurance
                
                VStack(alignment:.leading){
                    Text("Insurance")
                        .font(.title)
                        .bold()
                        
                    Text("Top plans at affordable prices for you")
                        .font(.callout)
                    
                    
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                ForEach(InsuranceList,id:\.self){
                                    investment in
                                    
                                    VStack{
                                        Image(systemName: "person.fill")
                                            .frame(width: 40,height: 40)
                                            .background(Color.purple.opacity(0.2))
                                            .cornerRadius(20)
                                        Text(investment)
                                    }
                                    .padding()
                                    
                                }
                            }
                            
                        }
                    
                }
                .frame(maxWidth:.infinity)
                //Diversify your portfolio
                    .padding()
                Divider()
                
                // UpLearn
                
                VStack(alignment:.leading){
                    Text("Uplearn")
                        .font(.title)
                        .bold()
                        
                    Text("Expert courses to get better at investing & trading")
                        .font(.callout)
                    
                    
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                
                                    VStack{
                                        Image(systemName: "person.fill")
                                            .frame(width: 40,height: 40)
                                            .background(Color.purple.opacity(0.2))
                                            .cornerRadius(20)
                                        Text("Tutorials")
                                    }
                                    .padding()
                                    
                                
                            }
                            
                        }
                    
                }
                .frame(maxWidth:.infinity)
                //Diversify your portfolio
                    .padding()
                Divider()
                
                //QuickLinks
                VStack(alignment:.leading){
                    Text("QuickLinks")
                        .font(.title)
                        .bold()
                        
                    Text("Easy access to trade mode and our social media channels")
                        .font(.callout)
                    
                    
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack {
                                ForEach(Quicklinks,id:\.self){
                                    investment in
                                    
                                    VStack{
                                        Image(systemName: "person.fill")
                                            .frame(width: 40,height: 40)
                                            .background(Color.purple.opacity(0.2))
                                            .cornerRadius(20)
                                        Text(investment)
                                    }
                                    .padding()
                                    
                                }
                            }
                            
                        }
                    
                }
                .frame(maxWidth:.infinity)
                //Diversify your portfolio
                    .padding()
                Divider()
                
                
                
            }
        }
    }
}
#Preview{
    MoreView()
}
