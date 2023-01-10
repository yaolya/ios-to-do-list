//
//  ToDoItemModel.swift
//  ios-to-do-list
//
//  Created by Оля Галягина on 01.01.2023.
//

import Foundation


struct Task {
    
    var name: String
    
    var details: String
    
    var startDate: Date
    
    var completionDate: Date
    
    var isComplete: Bool
    
    init(name:String, details:String, completionDate: Date) {
        self.name = name
        self.details = details
        self.completionDate = completionDate
        self.startDate = Date()
        self.isComplete = false
    }
    
}
