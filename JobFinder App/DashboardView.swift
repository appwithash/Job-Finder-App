//
//  DashboardView.swift
//  JobFinder App
//
//  Created by ashutosh on 29/06/21.
//

import SwiftUI

struct DashboardView: View {
    @State var searchText = ""
    @State var isLoading = false
    @State var isFilterTapped = false
    @EnvironmentObject var jobFilter : FilterJobData

    var body: some View {
        ZStack{
            Color("dashboardBackground").ignoresSafeArea()
            VStack(alignment:.leading){
                HStack{
                VStack(alignment:.leading,spacing:4){
                    Capsule()
                        .frame(width: Screen.maxWidth*0.08, height: Screen.maxheight*0.004, alignment: .center)
                    Capsule()
                        .frame(width: Screen.maxWidth*0.06, height: Screen.maxheight*0.004, alignment: .center)
                }
                Spacer()
                VStack(spacing:1){
                    Circle()
                        .stroke(lineWidth: 2.5)
                        .frame(width: Screen.maxWidth*0.02, height: Screen.maxWidth*0.02, alignment: .center)
                    Capsule()
                        .trim(from: 0.0, to: 0.5)
                        .stroke(lineWidth: 2.5)
                        .frame(width: Screen.maxWidth*0.05, height: Screen.maxWidth*0.05, alignment: .center)
                        .rotationEffect(.degrees(180))
                }
            }.padding(.leading,Screen.maxWidth*0.07).padding(.trailing,Screen.maxWidth*0.07)
            ScrollView(.vertical, showsIndicators: false){
                VStack(alignment:.leading){
            VStack(alignment:.leading){
            Text("Hi Ashutosh,").font(.custom("Verdana", size: 30)).unredacted()
            Text("Find your Dream Job").font(.custom("Verdana", size: 30)).unredacted()
            }.padding(.top).padding(.bottom).padding(.trailing).padding(.leading,Screen.maxWidth*0.07)
                HStack(spacing:Screen.maxWidth*0.04){
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: Screen.maxWidth*0.66, height: Screen.maxheight*0.07, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                        HStack(spacing:Screen.maxWidth*0.03){
                            VStack(spacing:0){
                                Circle()
                                    .stroke(lineWidth: 2.5)
                                    .frame(width: Screen.maxWidth*0.035, height: Screen.maxWidth*0.035, alignment: .center)
                                Capsule()
                                    .stroke(lineWidth: 2.5)
                                    .frame(width: 1, height: Screen.maxWidth*0.015, alignment: .center)
                                    .rotationEffect(.degrees(180))
                            }.rotationEffect(.degrees(-45))
                        TextField( "Search job", text: $searchText)
                            .frame(width: Screen.maxWidth*0.5, height: Screen.maxheight*0.07, alignment: .center).unredacted()
                        }
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: Screen.maxWidth*0.15, height: Screen.maxheight*0.07, alignment: .center)
                        HStack(spacing:3){
                            ZStack{
                            Capsule().frame(width: Screen.maxWidth*0.007, height: Screen.maxheight*0.025, alignment: .center)
                                .foregroundColor(.white)
                                Circle().fill(Color.white)
                                    .frame(width: Screen.maxWidth*0.015, height:  Screen.maxWidth*0.015, alignment: .center)
                                    .offset( y: 5)
                            }
                            ZStack{
                            Capsule().frame(width: Screen.maxWidth*0.007, height: Screen.maxheight*0.025, alignment: .center)
                                .foregroundColor(.white)
                                Circle().fill(Color.white)
                                    .frame(width: Screen.maxWidth*0.015, height:  Screen.maxWidth*0.015, alignment: .center)
                                    .offset( y: -5)
                            }
                            ZStack{
                            Capsule().frame(width: Screen.maxWidth*0.007, height: Screen.maxheight*0.025, alignment: .center)
                                .foregroundColor(.white)
                                Circle().fill(Color.white)
                                    .frame(width: Screen.maxWidth*0.015, height:  Screen.maxWidth*0.015, alignment: .center)
                                    .offset( y: 5)
                            }
                        }
                        Circle().frame(width: Screen.maxWidth*0.02, height: Screen.maxWidth*0.02, alignment: .center)
                            .foregroundColor(Color("orange"))
                            .offset(x: Screen.maxWidth*0.04, y: -Screen.maxWidth*0.035)
                            .opacity(self.jobFilter.isFilterApplied ? 1 : 0)
                    }
                    .onTapGesture {
                        self.isFilterTapped=true
                    }
                    .sheet(isPresented: $isFilterTapped, content: {
                        DashboardFilterView()
                    })
                }.padding(.leading,Screen.maxWidth*0.07)
                
                Text("Popular Company").font(.custom("Verdana", size: 15)).unredacted()
                    .padding(.top).padding(.bottom).padding(.leading,Screen.maxWidth*0.07)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                    PopularJobView().padding(.leading,Screen.maxWidth*0.07)
                    })
                Text("Recent Jobs").font(.custom("Verdana", size: 15)).unredacted()
                    .padding(.top).padding(.bottom).padding(.leading,Screen.maxWidth*0.07)
                    
                RecentJobView()
                    .padding(.leading,Screen.maxWidth*0.07)
                    .padding(.trailing,Screen.maxWidth*0.07)
            Spacer()
            }
            }
            }.redacted(reason: isLoading ? .placeholder : [])
            .onAppear{
                self.isLoading=true
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    self.isLoading=false
                })
            }
        }.navigationBarHidden(true)
    }
    
}

struct RecentJob : Identifiable{
    let id = UUID()
    let jobPostion : String
    let comanyName : String
    let jobType : String
    let imageName : String
}

struct  RecentJobView : View {
    var recentJobList : [RecentJob] = [
        RecentJob(jobPostion: "junior iOS developer", comanyName: "soundcloud", jobType: "remote", imageName: "soundcloud"),
        RecentJob(jobPostion: "iOS developer", comanyName: "linkedIn", jobType: "part-time", imageName: "linkedin"),
        RecentJob(jobPostion: "UI/UX designer", comanyName: "Uber", jobType: "full-time", imageName: "uber"),
        RecentJob(jobPostion: "Senior iOS developer", comanyName: "Swiggy", jobType: "remote", imageName: "swiggy"),
        RecentJob(jobPostion: "junior iOS developer", comanyName: "zomato", jobType: "full-time", imageName: "zomato"),
        
    ]
    var body : some View{
        VStack{
            ForEach(recentJobList){job in
                RecentJobCell(job: job)
            }
        }
    }
}

struct  RecentJobCell : View {
    let job : RecentJob
    var body : some View{
        ZStack{
           RoundedRectangle(cornerRadius: 15)
            .frame(width: Screen.maxWidth*0.85, height: Screen.maxheight*0.08, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.white)
            HStack{
                HStack(spacing:10){
                    Image(job.imageName).resizable()
                .frame(width: Screen.maxWidth*0.12, height:  Screen.maxWidth*0.12, alignment: .center)
                .cornerRadius(10)
                    VStack(alignment:.leading,spacing:3){
                    Text(job.jobPostion).font(.custom("Verdana", size: 15))
                    Text("\(job.comanyName) • \(job.jobType)").font(.custom("Verdana", size: 11)).foregroundColor(.gray)
                }
                }.padding(.leading)
                Spacer()
                VStack(spacing:2){
                    Circle().frame(width: 3, height: 3, alignment: .center)
                    Circle().frame(width: 3, height: 3, alignment: .center)
                    Circle().frame(width: 3, height: 3, alignment: .center)
                }.padding(.trailing)
            }
        }
       
    }
}

struct PopularJob : Identifiable{
    let id = UUID()
    let image : String
    let minSalary : String
    let maxSalary : String
    let position : String
    let companyName : String
    let place : String
    let tags : [String]
    let theme : Color
}
struct PopularJobView : View{
    var popularJobList : [PopularJob] = [
        PopularJob(image: "amazon", minSalary: "80", maxSalary: "120", position: "Senior iOS developer", companyName: "Amazon", place: "Cailifornia", tags: ["remote","anytime","developer"], theme: .black),
        PopularJob(image: "zomato", minSalary: "70", maxSalary: "90", position: "UI/UX designer", companyName: "Zomato", place: "Cailifornia", tags: ["remote","anytime","developer"], theme: .white),
        PopularJob(image: "nike", minSalary: "50", maxSalary: "80", position: "Junior iOS developer", companyName: "Nike", place: "Cailifornia", tags: ["remote","anytime","developer"], theme: .black),
        PopularJob(image: "swiggy", minSalary: "65", maxSalary: "90", position: "Android developer", companyName: "Swiggy", place: "Cailifornia", tags: ["remote","anytime","developer"], theme: .white),
        PopularJob(image: "linkedin", minSalary: "90", maxSalary: "120", position: "Project Manager", companyName: "LinkedIn", place: "Cailifornia", tags: ["remote","anytime","developer"], theme: .white),
    ]
    var body: some View{
      
        HStack(spacing:Screen.maxWidth*0.05){
                ForEach(popularJobList){job in
                    PopularJobCell(job: job)
                }
            }
     
        
    }
}

struct PopularJobCell : View{
    let job : PopularJob
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 20.0)
                .frame(width: Screen.maxWidth*0.7, height: Screen.maxheight*0.2, alignment: .center)
                .foregroundColor(job.theme == .white ?  Color.white : .black)
            VStack(alignment:.leading,spacing:5){
            HStack(spacing:Screen.maxWidth*0.3){
                ZStack{
                    Color.white
                    Image(job.image)
                    .resizable()
                } .frame(width: Screen.maxWidth*0.12, height:  Screen.maxWidth*0.12, alignment: .center)
                .cornerRadius(10)
                
                Text("$\(job.minSalary)k-\(job.maxSalary)k")
                    .foregroundColor(job.theme == .white ?  .black : .white)
                    .font(.custom("Verdana", size: 15))
            }
                Text(job.position)
                    .foregroundColor(job.theme == .white ?  .black : .white)
                    .font(.custom("Verdana", size: 15))
                Text("\(job.companyName) • \(job.place)")
                    .foregroundColor(job.theme == .white ?  .black : .white)
                    .font(.custom("Verdana", size: 11)).padding(.bottom,4)
                HStack{
                    ForEach(0..<job.tags.count){i in
                        if(job.theme==Color.black){
                        ZStack{
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(Color("gray"))
                                .frame(width: Screen.maxWidth*0.18, height: Screen.maxheight*0.03, alignment: .center)
                            Text(job.tags[i])
                                .foregroundColor(.white).font(.custom("Verdana", size: 11))
                        }
                        }else{
                            ZStack{
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.gray)
                                    .frame(width: Screen.maxWidth*0.18, height: Screen.maxheight*0.03, alignment: .center)
                                Text(job.tags[i])
                                    .foregroundColor(.black)
                                    .font(.custom("Verdana", size: 11))
                            }
                        }
                    }
                }
        }
        }
    }
}
struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView().environmentObject(FilterJobData())
    }
}
