//
//  CreateToDo.swift
//  ToDoApp
//
//  Created by Edén Garza on 4/23/22.
//

import SwiftUI

struct CreateToDo: View {
    @State var toDoTitle = ""
    @State var important = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        List {
            Section {
                TextField("Todo Item", text: $toDoTitle)
            }
            Section {
                Toggle(isOn: $important, label: {
                    Text("Important")
                })
            }
            Section {
                HStack {
                    Spacer()
                    Button("Save") {
                        self.toDoStorage.todos.append(ToDoItem(title: self.toDoTitle, important: self.important))
                        self.presentationMode.wrappedValue.dismiss()
                    }.disabled(toDoTitle.isEmpty)
                    Spacer()
                }
            }
        }
    }
}

struct CreateToDo_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDo().environmentObject(ToDoStorage())
    }
}
