//
//  DashboardFilterView.swift
//  JobFinder App
//
//  Created by ashutosh on 29/06/21.
//

import SwiftUI

struct DashboardFilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var jobFilter : FilterJobData
    @State var subview = false
    var categoryList : [String] = ["Junior iOS developer","Senior iOS developer","Android developer", "React developer", "Project Manager",
    ]
    var subCategoryList : [String] = ["Junior iOS developer","Senior iOS developer","Android developer", "React developer", "Project Manager",
       ]
    
    @State var isJobSelected : [Bool] = [false,false,false,false,false]
    var SelectedJobType : [String] = ["remote","full-time","part-time","freelance","contract"]
    var gridView : [GridItem] = [GridItem(.fixed(130), spacing: 1, alignment: .center)]
    var body: some View {
        VStack(spacing:Screen.maxWidth*0.05){
            Text("Set Filter").font(.custom("Verdana", size: 20)).padding(.top)
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(alignment:.leading,spacing:Screen.maxWidth*0.05){
                    DropDownView( titleName: "Category", category:  self.$jobFilter.category ,categoryList: categoryList)
                   
                    DropDownView(titleName: "Sub category", category: self.$jobFilter.subCategory,categoryList: subCategoryList)
                      
                    DropDownView(titleName: "Location", category:  self.$jobFilter.location,categoryList: subCategoryList)
                  
                    HStack{
                        Text("Min. Salary").font(.custom("Verdana", size: 15)).foregroundColor(.gray)
                        Spacer()
                        Text("Max. Salary").font(.custom("Verdana", size: 15)).foregroundColor(.gray)
                    }
                    Text("Job Type").font(.custom("Verdana", size: 15))
                    VStack{
                    HStack{
                            ZStack{
                                if self.isJobSelected[0]{
                                RoundedRectangle(cornerRadius: 10.0)
                                 
                                    .foregroundColor(self.isJobSelected[0] ? Color("orange") : .white)
                                    .frame( height: Screen.maxheight*0.055, alignment: .center)
                                }else{
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(self.isJobSelected[0] ? .white : Color.gray)
                                }
                                Text("part-time").font(.custom("Verdana", size: 15)).foregroundColor(self.isJobSelected[0] ? .white : .black)
                            }.onTapGesture {
                                self.isJobSelected[0].toggle()
                                if  self.isJobSelected[0]{
                                    self.jobFilter.tags.append("part-time")
                                }
                            }
                        ZStack{
                            if self.isJobSelected[1]{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.isJobSelected[1] ? Color("orange") : .white)
                               
                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.isJobSelected[1] ? .white : Color.gray)
                            }
                        Text("full-time").font(.custom("Verdana", size: 15)).foregroundColor(self.isJobSelected[1] ? .white : .black)
                        }
                        .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.isJobSelected[1].toggle()
                            if  self.isJobSelected[1]{
                                self.jobFilter.tags.append("full-time")
                            }
                        }
                        ZStack{
                            if self.isJobSelected[2]{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.isJobSelected[2] ? Color("orange") : .white)
                               
                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.isJobSelected[2] ? .white : Color.gray)
                            }
                        Text("contract").font(.custom("Verdana", size: 15)).foregroundColor(self.isJobSelected[2] ? .white : .black)
                        }   .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.isJobSelected[2].toggle()
                            if  self.isJobSelected[2]{
                                self.jobFilter.tags.append("contract")
                            }
                        }
                      
                    }
                        HStack{
                        ZStack{
                            if self.isJobSelected[3]{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.isJobSelected[3] ? Color("orange") : .white)
                               
                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.isJobSelected[3] ? .white : Color.gray)
                            }
                        Text("remote").font(.custom("Verdana", size: 15)).foregroundColor(self.isJobSelected[3] ? .white : .black)
                            
                        }  .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.isJobSelected[3].toggle()
                            if  self.isJobSelected[3]{
                                self.jobFilter.tags.append("remote")
                            }
                        }
                            ZStack{
                                if self.isJobSelected[4]{
                                RoundedRectangle(cornerRadius: 10.0)
                                 
                                    .foregroundColor(self.isJobSelected[4] ? Color("orange") : .white)
                                 
                                }else{
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(self.isJobSelected[4] ? .white : Color.gray)
                                }
                            Text("freelance").font(.custom("Verdana", size: 15)).foregroundColor(self.isJobSelected[4] ? .white : .black)
                            }  .frame( height: Screen.maxheight*0.055, alignment: .center)
                            .onTapGesture {
                                self.isJobSelected[4].toggle()
                                if  self.isJobSelected[4]{
                                    self.jobFilter.tags.append("freelance")
                                }
                            }
                        }
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            self.jobFilter.showData()
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .frame(height:Screen.maxheight*0.06)
                                    .foregroundColor(.black)
                                Text("Apply Filter").font(.custom("Verdana", size: 20)).foregroundColor(.white)
                            }
                        }).padding(.top)
                    }
                }.padding(.leading,Screen.maxWidth*0.06).padding(.trailing,Screen.maxWidth*0.06)
            })
            Spacer()
        }
    }
}

struct DropDownView : View{
   
    @EnvironmentObject var jobFilter : FilterJobData
    
    @State var titleName : String
    @Binding var category : String
    var categoryList : [String]
    @State var showCategory = false
    @State var categorySelected = false
 
    var body: some View{
        ZStack{
        VStack(alignment:.leading){
            Text(titleName).font(.custom("Verdana", size: 15))
            ZStack{
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.gray)
                HStack{
                    Text(category).foregroundColor(categorySelected ? .black : .gray).padding(.leading)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(self.showCategory ? 180 : 0))
                        .padding(.trailing)
                }
                .onTapGesture {
                    showCategory.toggle()
                }
            }.frame(width: Screen.maxWidth*0.9, height: Screen.maxheight*0.06, alignment: .center).animation(.default)
           
            if showCategory{
                Group{
                    VStack{
                        ForEach(categoryList,id: \.self){category in
                                ZStack{
                                        RoundedRectangle(cornerRadius: 10.0)
                                            .stroke(Color("gray")) .frame(width: Screen.maxWidth*0.9, height: Screen.maxheight*0.06, alignment: .center)
                                        Text(category).font(.custom("Verdana", size: 15))
                                        
                                }.onTapGesture {
                                    self.category=category
                                    self.categorySelected.toggle()
                                
                                    showCategory.toggle()
                                   
                                }
                            
                        }
                    }
                }
        }
        }
        }
    }
    
}
struct Category : Identifiable{
    let id = UUID()
    let name : String
    let items : [Category]
}

struct DashboardFilterView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardFilterView()
    }
}
