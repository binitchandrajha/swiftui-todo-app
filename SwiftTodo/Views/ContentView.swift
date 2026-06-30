//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Outcode on 27/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var todoList: [TodoItem] = [
        TodoItem(
            title: "TodoItem 1",
            isCompleted: false
        ),
        TodoItem(
        
            title: "TodoItem 2",
            isCompleted: true
        ),
        TodoItem(
  
            title: "TodoItem 3",
            isCompleted: false
        ),
        TodoItem(
        
            title: "TodoItem 4",
            isCompleted: true
        ),
        TodoItem(
       
            title: "TodoItem 5",
            isCompleted: false
        )
    ]
    var body: some View {
        VStack {
            List(todoList){ list in
                TodoItemView(todoItem: list)
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
