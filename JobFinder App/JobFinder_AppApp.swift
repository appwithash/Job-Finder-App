//
//  JobFinder_AppApp.swift
//  JobFinder App
//
//  Created by ashutosh on 29/06/21.
//

import SwiftUI

@main
struct JobFinder_AppApp: App {
   var  jobFilter  = FilterJobData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(jobFilter)
        }
    }
}
