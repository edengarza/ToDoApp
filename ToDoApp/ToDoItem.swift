//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Edén Garza on 4/22/22.
//

import Foundation

struct ToDoItem: Identifiable {
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
}
