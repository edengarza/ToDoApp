//
//  ContentView.swift
//  ToDoApp
//
//  Created by Edén Garza on 4/22/22.
//

import SwiftUI

struct ToDoListView: View {
    @EnvironmentObject var toDoStorage: ToDoStorage
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.toDoStorage.todos) { todo in
                    if todo.important {
                        Text(todo.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(3)
                            .background(Rectangle()
                                .foregroundColor(.red))
                            .cornerRadius(5)
                    } else {
                        Text(todo.title)
                    }
                }
                .onDelete(perform: { indexSet in
                    if let index = indexSet.first {
                        self.toDoStorage.todos.remove(at: index)
                    }
                })
            }
            .navigationTitle("Todo")
            .toolbar(content: {
                NavigationLink(destination: CreateToDo(), label: {
                    Text("Add")
                })
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView().environmentObject(ToDoStorage())
    }
}
