//
//  SearchOverlayView.swift
//  JobFinder App
//
//  Created by ashutosh on 01/07/21.
//

import SwiftUI

struct SearchOverlayView: View {
    var popularJob : [Job] = [
    ]
    @State var isLoading = false
    var body: some View {
        ZStack{
            Color("dashboardBackground").ignoresSafeArea()
          SearchJobView()
            .padding(.leading,Screen.maxWidth*0.07)
            .padding(.trailing,Screen.maxWidth*0.07)
            .redacted(reason: self.isLoading ? .placeholder : [])
        }.onAppear{
            self.isLoading=true
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                self.isLoading=false
            }
        }
    }
}

struct  SearchJobView : View {
    var recentJobList : [Job] = [
        Job(companyLogo: "nike", companyName: "Nike", aboutCompany: "Nike is a company", jobTitle: "Buisness Analysist", minSalary: 70, maxSalary: 90, jobType: "remote", place: "Mumbai", tags: ["Buisness","Nike","remote"], theme: .black),
        Job(companyLogo: "zomato", companyName: "Zomato", aboutCompany: "Zomato is a company", jobTitle: "Android Developer", minSalary: 80, maxSalary: 120, jobType: "Full-time", place: "Banglore", tags: ["Buisness","Nike","full-time"], theme: .white),
        Job(companyLogo: "amazon", companyName: "Amazon", aboutCompany: "Amazon is a ecommerce company", jobTitle: "Logo Designer", minSalary: 70, maxSalary: 80, jobType: "contract", place: "Mumbai", tags: ["Designer","UI/UX","Logo"], theme: .black),
        Job(companyLogo: "swiggy", companyName: "Swiggy", aboutCompany: "Swiggy is a company", jobTitle: "iOS Developer", minSalary: 90, maxSalary: 110, jobType: "full-time", place: "Mumbai", tags: ["Buisness","Nike","full-time"], theme: .white),
        Job(companyLogo: "linkedin", companyName: "LinkedIn", aboutCompany: "LinkedIn is a company", jobTitle: "Buisness Analysist", minSalary: 70, maxSalary: 90, jobType: "consultant", place: "Mumbai", tags: ["Buisness","LinkedIn","consultant"], theme: .white),
        Job(companyLogo: "nike", companyName: "Nike", aboutCompany: "Nike is a company", jobTitle: "Buisness Analysist", minSalary: 70, maxSalary: 90, jobType: "remote", place: "Mumbai", tags: ["Buisness","Nike","remote"], theme: .black),
        Job(companyLogo: "zomato", companyName: "Zomato", aboutCompany: "Zomato is a company", jobTitle: "Android Developer", minSalary: 80, maxSalary: 120, jobType: "Full-time", place: "Banglore", tags: ["Buisness","Nike","full-time"], theme: .white),
        Job(companyLogo: "amazon", companyName: "Amazon", aboutCompany: "Amazon is a ecommerce company", jobTitle: "Logo Designer", minSalary: 70, maxSalary: 80, jobType: "contract", place: "Mumbai", tags: ["Designer","UI/UX","Logo"], theme: .black),
        Job(companyLogo: "swiggy", companyName: "Swiggy", aboutCompany: "Swiggy is a company", jobTitle: "iOS Developer", minSalary: 90, maxSalary: 110, jobType: "full-time", place: "Mumbai", tags: ["Buisness","Nike","full-time"], theme: .white),
        Job(companyLogo: "linkedin", companyName: "LinkedIn", aboutCompany: "LinkedIn is a company", jobTitle: "Buisness Analysist", minSalary: 70, maxSalary: 90, jobType: "consultant", place: "Mumbai", tags: ["Buisness","LinkedIn","consultant"], theme: .white),
]
    var body : some View{
        VStack{
            ForEach(recentJobList){job in
                JobCell(job: job)
            }
        }
    }
}

struct SearchOverlayView_Previews: PreviewProvider {
    static var previews: some View {
        SearchOverlayView()
    }
}
