//
//  Mission.swift
//  SwiftUI(Project 8-Moon Shot)
//
//  Created by Srinivas Sahu on 10/11/21.
//

import Foundation

struct Mission:Codable,Identifiable{
    struct CrewRole:Codable{
        let name:String
        let role:String
    }
    
    let id:Int
    let launchDate:Date?
    let crew:[CrewRole]
    let description:String
    
    var image:String{
        "apollo\(id)"
    }
    var displayName:String{
        "apollo\(id)"
    }
    var formattedLaunchDate:String{
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
