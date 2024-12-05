//
//  PortfolioView.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import SwiftUI

struct PortfolioView: View {
   @State var portfolioSelected=true
    @State var exploreSelected=false
    @State var stocksSelected=true
     @State var listsSelected=false
    @State var themesSelected=false
   
    var body: some View {
        VStack(alignment:.leading){
            HStack(alignment:.top){
                Button("Portfolio"){
                    portfolioSelected.toggle()
                    exploreSelected.toggle()
                    
                }
                
                .foregroundColor(portfolioSelected ? .pink : .gray)
                
                .padding()
                Button("Explore"){
                    portfolioSelected.toggle()
                    exploreSelected.toggle()
                }
                .foregroundColor(exploreSelected ? .pink : .gray)
                .padding()
                
                Spacer()
            }
            Divider()
            ScrollView{
                MovingBar()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 50)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: .infinity,height: 100)
                    .overlay{
                        HStack{
                            Image(systemName: "lightbulb.max.fill")
                                .resizable()
                                .foregroundColor(.yellow)
                                .frame(width: 30,height: 30)
                            
                            Text("Start Investing now. Your account has been created ")
                                .font(.subheadline)
                                .bold()
                        }
                        
                    }
                    .padding()
                HStack{
                    VStack(alignment:.leading){
                        Text("Investing is for everybody!")
                            .font(.headline)
                        Text("Top Companies to get you started")
                            .foregroundColor(.yellow)
                            .font(.title)
                    }
                    .padding()
                    Image(systemName: "trophy.circle")
                        .resizable()
                        .frame(width:40,height: 40)
                        .foregroundColor(.orange.opacity(0.7))
                    
                }
                ScrollView(.horizontal){
                    HStack{
                        ForEach(1...10,id:\.self){ _ in
                            VStack{
                                Image(systemName: "person")
                                    .padding()
                                Text("Company Name")
                                
                                Text("Stock Price")
                                Text("Increment/Decrement %")
                                
                                
                            }
                            .frame(width: 150,height: 180)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    
                }
                HStack{
                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.title)
                    Spacer()
                    
                }
                .padding()
                
//                Divider()
                
                HStack{
                    Button("Stocks"){
                        stocksSelected.toggle()
                        if listsSelected==true {
                            listsSelected.toggle()
                        }
                        else{
                            themesSelected.toggle()
                        }
                        
                    }
                    
                    .foregroundColor(stocksSelected ? .pink : .gray)
                    
                    .padding()
                    Button("Lists"){
                        listsSelected.toggle()
                        if stocksSelected==true {
                            stocksSelected.toggle()
                        }
                        else{
                            themesSelected.toggle()
                        }
                    }
                    .foregroundColor(listsSelected ? .pink : .gray)
                    .padding()
                    
                    Button("Themes"){
                        themesSelected.toggle()
                        if stocksSelected==true {
                            stocksSelected.toggle()
                        }
                        else{
                            listsSelected.toggle()
                        }
                    }
                    .foregroundColor(themesSelected ? .pink : .gray)
                    .padding()
                    
                    Spacer()
                    
                }
                Divider()
                
                VStack{
                    ForEach(1...10,id:\.self){stock in
                        
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 350,height: 180)
                            .overlay{
                                VStack {
                                    HStack{
                                        Image(systemName: "eraser.fill")
                                        Spacer()
                                        Text("Company Name")
                                            .bold()
                                    }
                                    .padding()
                                    HStack{
                                        VStack{
                                            Text("Current Value")
                                                .bold()
                                            Text("Inr 400")
                                        }
                                        
                                        
                                        Spacer()
                                        
                                        VStack{
                                            Text("Total P&L")
                                                .bold()
                                            Text("Inr 111(1.58%")
                                        }
                                        
                                        
                                        
                                    }
                                }
                                .padding()
                            }
                            
                        
                    }
                }
                
                
            }
            
            }
            
                
            
        
    }
}

#Preview {
    PortfolioView()
}
