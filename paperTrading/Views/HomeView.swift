//
//  HomeView.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack{
                MovingBar()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue.opacity(0.8))
                    .frame(width:370,height:100)
                    .overlay{
                        Text("Learn from experts and invest with confidence ->")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
               
                VStack(alignment:.leading){
                    
                    Text("Net Worth")
                    Text("USD 99,99,99,99,999")
                        .font(.title)
                        .foregroundColor(.black)
                }
                VStack{
                    HStack(){
                        Text("Your Portfolio")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 70,height: 70)
                    }
                    .padding(.horizontal)
                    
                    VStack{
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .frame(width: 320,height: 80)
                            .overlay{
                                HStack{
                                    VStack{
                                        Text("Mutual Funds")
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("100%")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    Spacer()
                                    
                                    VStack{
                                        Text("USD 793993")
                                            .foregroundColor(.black)
                                            .bold()
                                        Text("USD 193(1.54%)")
                                            .foregroundColor(.black)
                                    }
                                    .padding()
                                    
                                }
                            }
                    }
                    
                }
                .frame(width:350,height: 350)
                .background(Color.purple.opacity(0.8))
                .cornerRadius(10)
                
                HStack{
                    Text("Discover More")
                        .font(.title)
                        .bold()
                    Spacer()
                }
                .frame(width: 350)
                
                
                HStack {
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            
                            VStack {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 120,height: 120)
                                .padding()
                                Text("Life Insurance")
                            }
                            VStack {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 120,height: 120)
                                .padding()
                                Text("Motor Insurance")
                            }
                            VStack {
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 120,height: 120)
                                .padding()
                                Text("Import Stocks")
                            }
                            VStack {
                                Circle()
                                    .fill(Color.orange)
                                    .frame(width: 120,height: 120)
                                .padding()
                                Text("Import MF")
                            }
                            VStack {
                                Circle()
                                    .fill(Color.yellow)
                                    .frame(width: 120,height: 120)
                                .padding()
                                Text("Import Banks")
                            }
                        }
                        
                    }
                }
                .frame(width: 350)
                .padding()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.teal)
                    .frame(width: 350,height: 200)
                    .overlay{
                        VStack(alignment:.leading){
                            Text("Instant Investing")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                            
                            Text("Start investing instantly with curated MF baskets")
                                .foregroundColor(.white)
                        
                                
                            
                            Button("Get Started"){
                                
                            }
                            .font(.system(size: 16))
                            .bold()
                            .frame(width: 100,height: 20)
                            .foregroundColor(.purple)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(40)
                            
                        }
                        
                    }
                
               
                

                    
            }
        }
    }
}

#Preview {
    HomeView()
}
