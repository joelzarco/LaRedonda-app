//
//  PageModel.swift
//  LaRedonda
//
//  Created by sergio joel camacho zarco on 29/04/23.
//

import Foundation

struct Page : Identifiable, Equatable{
    let id = UUID()
    var name : String
    var description : String
    var imageUrl : String
    var tag : Int
    
    static var onboardPages : [Page] = [
        Page(name: "welcome 1", description: "description1", imageUrl: "EspumosoDulce4", tag: 0),
        Page(name: "welcome 2", description: "description2", imageUrl: "ROSADO-RUBY-2", tag: 1),
        Page(name: "welcome 3", description: "description3", imageUrl: "SauvignonBlanc1", tag: 2),
        Page(name: "welcome 4", description: "decription4", imageUrl: "SierraGorga-Crianza-1", tag: 3)
    ]
}
