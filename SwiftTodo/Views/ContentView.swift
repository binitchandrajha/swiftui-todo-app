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
        ),
        TodoItem(
            title: "TodoItem 6",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 7",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 8",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 9",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 10",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 11",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 12",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 13",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 14",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 15",
            isCompleted: false
        )
    ]
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                List(todoList){ list in
                    TodoItemView(todoItem: list)
                }.listRowSpacing(10).listStyle(.plain)
                Spacer()
            }
            FabButton(onClick:  {}).padding(.trailing, 24).padding(. bottom, 40)
        }
    }
}

#Preview {
    ContentView()
}
