//
//  MovingBar.swift
//  paperTrading
//
//  Created by Piyush Anand on 24/11/24.
//

import SwiftUI
 
struct MovingBar:View {
    @State var offsetX:CFloat = -200
    var body: some View {
        VStack {
            HStack{
                ForEach(1..<100,id:\.self){number in
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 300,height: 50)
                        .overlay(
                            Capsule()
                                .stroke(Color.black,lineWidth: 2)
                        )
                        .overlay (
                            HStack{
                                Text("NIFTY BANK")
                                    .foregroundColor(.black)                                .bold()
                                
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(.green)
                                Text("51,135")
                                Text("+762 (1.51%)")
                                    .foregroundColor(.green)
                            }
                        )
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 300,height: 50)
                        .overlay(
                            Capsule()
                                .stroke(Color.black,lineWidth: 2)
                        )
                        .overlay (
                            HStack{
                                Text("NIFTY 50")
                                    .foregroundColor(.black)                                .bold()
                                
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(.green)
                                Text("23,907")
                                Text("+557 (2.39%)")
                                    .foregroundColor(.green)
                            }
                        )
                    Capsule()
                        .fill(Color.white)
                        .frame(width: 300,height: 50)
                        .overlay(
                            Capsule()
                                .stroke(Color.black,lineWidth: 2)
                        )
                        .overlay (
                            HStack{
                                Text("SENSEX")
                                    .foregroundColor(.black)                                .bold()
                                
                                Image(systemName: "triangle.fill")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                                    .foregroundColor(.green)
                                Text("79,117")
                                Text("+1.981 (2.54%)")
                                    .foregroundColor(.green)
                            }
                        )
                    
                    
                }
                   
            }
            .offset(x:CGFloat(offsetX))
            .onAppear{
                withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)){
                    offsetX=CFloat(UIScreen.main.bounds.width + 200)
                }
        }
        }
    }
}

#Preview {
    MovingBar()
}
