//
//  ContentView.swift
//  ToDoApp
//
//  Created by Edén Garza on 4/22/22.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach([ToDoItem(title: "Walk the dog", important: false), ToDoItem(title: "Buy pizza", important: true)]) { todo in
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
            }
            .navigationTitle("Todo")
            .toolbar(content: {
                NavigationLink(destination: ToDoListView(), label: {
                    Text("Add")
                })
            })
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
