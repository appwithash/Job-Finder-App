//
//  JobDescriptionView.swift
//  JobFinder App
//
//  Created by ashutosh on 01/07/21.
//

import SwiftUI

struct JobDescriptionView: View {
    var job : Job
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
       
            VStack{
                ZStack{
                    
                HStack{
                    Image(systemName: "chevron.left").padding(.leading)
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    Spacer()
                    Text(job.companyName).font(.custom("Verdana", size: 20)).bold().padding(.trailing).padding(.trailing)
                      
                    Spacer()
                   Text("")
                }  .offset(y:20)
                }.frame( height: Screen.maxheight*0.1, alignment: .center)
                .background( Color("dashboardBackground"))
            VStack(spacing:Screen.maxheight*0.02){
                Image(job.companyLogo)
                    .resizable()
                    .frame(width: Screen.maxWidth*0.2, height: Screen.maxWidth*0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(15)
                Text(job.jobTitle).font(.custom("Verdana", size: 30))
                Text("$\(job.minSalary)-$\(job.maxSalary)").font(.custom("Verdana", size: 20))
                HStack{
                ForEach(job.tags,id:\.self){tag in
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.gray)
                            .frame(width: Screen.maxWidth*0.25, height: Screen.maxheight*0.04, alignment: .center)
                        Text(tag).font(.custom("Verdana", size: 15))
                    }
                }
                }
                HStack{
                    Button(action: {
                        
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15.0)
                                .fill(Color("orange"))
                            Text("Description").font(.custom("Verdana", size: 15)).foregroundColor(.white)
                        }  .frame(width: Screen.maxWidth*0.45, height: Screen.maxheight*0.055, alignment: .center)
                    })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15.0)
                            .stroke(Color.gray)
                        Text("Company").font(.custom("Verdana", size: 15)).foregroundColor(.black)
                    }  .frame(width: Screen.maxWidth*0.45, height: Screen.maxheight*0.055, alignment: .center)
                })
                }
                VStack(spacing:Screen.maxheight*0.015){
                Text("About Job Opportunity")
                    .font(.custom("Verdana", size: 17))
                    .bold()
                    .padding(.top)
                    .padding(.trailing,Screen.maxWidth*0.4)
                    Text("We are looking for \(job.jobTitle) with 2-3 years of experience.Familier with swiftUI and UiKit.Eligible people apply for job and share your portfolio.").multilineTextAlignment(.leading)
                    .font(.custom("Verdana", size: 15))
                        .padding(.leading).padding(.trailing)
                
                Text("\(Text("Job type : ").font(.custom("Verdana", size: 15)).bold()) \(job.jobType)")
                    .padding(.trailing,Screen.maxWidth*0.55)
                Text("\(Text("Job location : ").font(.custom("Verdana", size: 15)).bold()) \(job.place)")
                    .padding(.trailing,Screen.maxWidth*0.49)
                }
                Spacer()
                Button(action: {
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10.0)
                            .frame(height:Screen.maxheight*0.06)
                            .foregroundColor(.black)
                        Text("Apply").font(.custom("Verdana", size: 20)).foregroundColor(.white)
                    }
                  
                }).padding()
                Spacer()
            }
                Spacer()
            }.frame(width: Screen.maxWidth).navigationBarHidden(true).ignoresSafeArea()//.background(Color("dashboardB"))
    }
  
}

struct JobDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        JobDescriptionView(job: Job(companyLogo: "amazon", companyName: "", aboutCompany: "", jobTitle: "", minSalary: 1, maxSalary: 1, jobType: "", place: "", tags: [""], theme: .white))
    }
}
