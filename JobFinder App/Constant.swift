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
