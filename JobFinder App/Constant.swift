//
//  Constant.swift
//  JobFinder App
//
//  Created by ashutosh on 29/06/21.
//

import Foundation
import SwiftUI
struct Screen{
    static let maxWidth = UIScreen.main.bounds.width
    static let maxheight = UIScreen.main.bounds.height
}

class FilterJobData : ObservableObject{
    @Published var category : String =  "Select Category"
    @Published var subCategory : String = "Selected Sub Category"
    @Published var location : String = "selected Location"
    @Published var tags : [String] = []
    @Published var isFilterApplied = false
    
    func showData(){
        print(category)
        print(subCategory)
        print(location)
        print(tags)
    }
}

class Job : ObservableObject,Identifiable{
    var id = UUID()
    var companyLogo : String
    var companyName : String
    var aboutCompany : String
    var jobTitle : String
    var minSalary : Int
    var maxSalary : Int
    var jobType : String
    var place : String
    var tags : [String]
    var theme : Color
    init(companyLogo : String, companyName : String, aboutCompany : String, jobTitle : String,  minSalary : Int, maxSalary : Int,jobType:String, place : String,tags : [String],theme : Color) {
        self.companyLogo=companyLogo
        self.companyName=companyName
        self.aboutCompany=aboutCompany
        self.jobTitle=jobTitle
        self.minSalary=minSalary
        self.maxSalary=maxSalary
        self.jobType = jobType
        self.place = place
        self.tags = tags
        self.theme=theme
    }
}
