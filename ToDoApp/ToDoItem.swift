//
//  ToDoItem.swift
//  ToDoApp
//
//  Created by Edén Garza on 4/22/22.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var important: Bool
    
    init(title: String, important: Bool) {
        self.title = title
        self.important = important
    }
}

class ToDoStorage: ObservableObject {
    @Published var todos = [ToDoItem]() {
        didSet {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(todos), forKey: "todos")
        }
    }
    
    init() {
        if let data = UserDefaults.standard.value(forKey: "todos") as? Data {
            if let userDefaultTodos = try? PropertyListDecoder().decode(Array<ToDoItem>.self, from: data) {
                todos = userDefaultTodos
            }
        }
    }
}
