//
//  TodoItemView.swift
//  SwiftTodo
//
//  Created by Outcode on 29/06/2026.
//

import Foundation
import SwiftUI

struct TodoItemView: View {
    var todoItem: TodoItem
    
    func handleDeleteTodoItem() {
        print("delete todo item")
    }
    
    func handleEditTodoItem() {
        print("edit todo item")
    }
   var body: some View {
       HStack(){
           HStack(){
               RadioButton(
                isChecked: true, onClick: {}
               )
               Text(todoItem.title)
           }
           Spacer()
           HStack(){
               AppIcon(icon: "trash", size: 18, foregroundColor: Color.red, onClick: handleDeleteTodoItem)
               Divider()
               AppIcon(icon: "pencil", size: 18, foregroundColor: Color.blue, onClick: handleEditTodoItem)
           }
       }
    }
}

#Preview {
    TodoItemView(
        todoItem: TodoItem(
            title: "Todo item",
            isCompleted: false
        )
    )
}

