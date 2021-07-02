//
//  ContentView.swift
//  JobFinder App
//
//  Created by ashutosh on 29/06/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
        ZStack{
            Color.black.ignoresSafeArea()
         
            VStack(alignment:.leading){
                HStack{
                    ZStack{
                        Circle()
                            .fill(Color("orange"))
                            .frame(width: Screen.maxWidth*1, height: Screen.maxWidth*1, alignment: .center)
                            .offset(x:Screen.maxWidth*0.6,y:Screen.maxheight*0.07)
                            .overlay(
                                VStack(spacing:3){
                                    ForEach(0..<70){_ in
                                    Capsule()
                                        .foregroundColor(.white)
                                        .frame(width: Screen.maxWidth, height: Screen.maxheight*0.004, alignment: .center)
                                    }
                                }
                                .clipShape(Circle())
                                .padding(.leading,Screen.maxheight*0.35)
                                .padding(.bottom,Screen.maxheight*0.3)
                             
                            )
                    Circle()
                        .fill(Color.white)
                        .frame(width: Screen.maxWidth*0.17, height:  Screen.maxWidth*0.17, alignment: .center)
                        .offset(x:-Screen.maxWidth*0.24,y:Screen.maxheight*0.010)
                    Circle()
                        .stroke(Color.white)
                        .frame(width: Screen.maxWidth*0.7, height:  Screen.maxWidth*0.7, alignment: .center)
                        .offset(x:-Screen.maxWidth*0.15,y:-Screen.maxheight*0.006)
                        
                    }.offset(x:-Screen.maxWidth*0.15,y:Screen.maxheight*0.1)
                   
                }
               
            VStack(spacing:0){
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.white)
                .frame(width: Screen.maxWidth*0.25, height: Screen.maxWidth*0.25, alignment: .center)
                
                HStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.white)
                .frame(width: Screen.maxWidth*0.55, height: Screen.maxWidth*0.55, alignment: .center)
                .rotationEffect(.degrees(45))
                .offset(y:-Screen.maxWidth*0.2)
                ZStack{
                    Circle()
                        .foregroundColor(.gray)
                        .frame(width: Screen.maxWidth*0.2, height:  Screen.maxWidth*0.2, alignment: .center)
                    Circle()
                        .foregroundColor(.black)
                        .frame(width: Screen.maxWidth*0.07, height:  Screen.maxWidth*0.07, alignment: .center)

                }
                }
                
            }.offset(x:Screen.maxWidth*0.13,y:-Screen.maxWidth*0.05)
                
                
                VStack(alignment:.leading, spacing:Screen.maxWidth*0.01){
                    Text("Find a perfect").font(.custom("Verdana", size: 35)).foregroundColor(.white)
                Text("Job Match").font(.custom("Verdana", size: 35)).foregroundColor(.white)
                    Text("One place with the best jobs companies in tech. Apply to all of them with a single profile get in touch with hiring managers directly").font(.custom("Verdana", size: 14)).foregroundColor(.white)
                        .frame(width:Screen.maxWidth*0.72,height: Screen.maxWidth*0.2, alignment: .center)
                        .multilineTextAlignment(.leading)
                    HStack(spacing:4){
                        Capsule()
                            .foregroundColor(.gray)
                            .frame(width: Screen.maxWidth*0.01, height: Screen.maxheight*0.005, alignment: .center)
                        Capsule()
                            .foregroundColor(.gray)
                            .frame(width: Screen.maxWidth*0.01, height: Screen.maxheight*0.005, alignment: .center)
                        Capsule()
                            .foregroundColor(.white)
                            .frame(width: Screen.maxWidth*0.05, height: Screen.maxheight*0.005, alignment: .center)
                    }.padding(.top).padding(.bottom)
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: DashboardView(),
                        label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: Screen.maxWidth*0.05)
                                        .foregroundColor(Color("orange"))
                                        .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.15, alignment: .center)
                                    Text("Get Started").foregroundColor(.white)
                                    
                                }
                            })
                      
                    Spacer()
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: Screen.maxWidth*0.05)
                            .frame(width: Screen.maxWidth*0.4, height: Screen.maxWidth*0.15, alignment: .center)
                        Text("Skip").foregroundColor(.white)
                    }
                    Spacer()
                }
                }.padding(.leading,Screen.maxWidth*0.06).padding(.bottom,Screen.maxWidth*0.85)
            }
            }
        }.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
