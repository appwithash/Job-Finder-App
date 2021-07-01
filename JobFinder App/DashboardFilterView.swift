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
    @State  var selectedJobType = ["remote":false,"full-time":false,"part-time":false,"freelance":false,"contract":false]
   
    
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
                                if self.selectedJobType["part-time"]!{
                                RoundedRectangle(cornerRadius: 10.0)
                                 
                                    .foregroundColor(self.selectedJobType["part-time"]! ? Color("orange") : .white)
                                    .frame( height: Screen.maxheight*0.055, alignment: .center)
                                }else{
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(self.selectedJobType["part-time"]! ? .white : Color.gray)
                                }
                                Text("part-time").font(.custom("Verdana", size: 15)).foregroundColor(self.selectedJobType["part-time"]! ? .white : .black)
                            } .frame( height: Screen.maxheight*0.055, alignment: .center)
                            .onTapGesture {
                                self.selectedJobType["part-time"]!.toggle()
                                if self.selectedJobType["part-time"]!{
                                    self.jobFilter.tags.append("part-time")
                                }else{
                                 self.jobFilter.tags.removeAll{$0=="part-time"}
                                }
                            }
                        ZStack{
                            if self.selectedJobType["full-time"]!{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.selectedJobType["full-time"]! ? Color("orange") : .white)

                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.selectedJobType["full-time"]! ? .white : Color.gray)
                            }
                        Text("full-time").font(.custom("Verdana", size: 15)).foregroundColor(self.selectedJobType["full-time"]! ? .white : .black)
                        }
                        .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.selectedJobType["full-time"]!.toggle()
                            if  self.selectedJobType["full-time"]!{
                                self.jobFilter.tags.append("full-time")
                            }else{
                                self.jobFilter.tags.removeAll{$0=="full-time"}
                               }
                        }
                        ZStack{
                            if self.selectedJobType["contract"]!{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.selectedJobType["contract"]! ? Color("orange") : .white)

                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.selectedJobType["contract"]! ? .white : Color.gray)
                            }
                        Text("contract").font(.custom("Verdana", size: 15)).foregroundColor(self.selectedJobType["contract"]! ? .white : .black)
                        }   .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.selectedJobType["contract"]!.toggle()
                            if  self.selectedJobType["contract"]!{
                                self.jobFilter.tags.append("contract")
                            }else{
                                self.jobFilter.tags.removeAll{$0=="contract"}
                               }
                        }
                      
                    }
                        HStack{
                        ZStack{
                            if self.selectedJobType["remote"]!{
                            RoundedRectangle(cornerRadius: 10.0)
                                .foregroundColor(self.selectedJobType["remote"]! ? Color("orange") : .white)

                            }else{
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(self.selectedJobType["remote"]! ? .white : Color.gray)
                            }
                        Text("remote").font(.custom("Verdana", size: 15)).foregroundColor(self.selectedJobType["remote"]! ? .white : .black)

                        }  .frame( height: Screen.maxheight*0.055, alignment: .center)
                        .onTapGesture {
                            self.selectedJobType["remote"]!.toggle()
                            if  self.selectedJobType["remote"]!{
                                self.jobFilter.tags.append("remote")
                            }else{
                                self.jobFilter.tags.removeAll{$0=="remote"}
                               }
                        }
                            ZStack{
                                if self.selectedJobType["freelance"]!{
                                RoundedRectangle(cornerRadius: 10.0)

                                    .foregroundColor(self.selectedJobType["freelance"]! ? Color("orange") : .white)

                                }else{
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .stroke(self.selectedJobType["freelance"]! ? .white : Color.gray)
                                }
                            Text("freelance").font(.custom("Verdana", size: 15)).foregroundColor(self.selectedJobType["freelance"]! ? .white : .black)
                            }  .frame( height: Screen.maxheight*0.055, alignment: .center)
                            .onTapGesture {
                                self.selectedJobType["freelance"]!.toggle()
                                if  self.selectedJobType["freelance"]!{
                                    self.jobFilter.tags.append("freelance")
                                }else{
                                    self.jobFilter.tags.removeAll{$0=="freelance"}
                                   }
                            }
                        }
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            self.jobFilter.showData()
                            self.jobFilter.isFilterApplied = true
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
        }.onAppear{
            for (key,_) in self.selectedJobType{
                if self.jobFilter.tags.contains(key){
                    self.selectedJobType[key] = true
                }
                }
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
        DashboardFilterView().environmentObject(FilterJobData())
    }
}
