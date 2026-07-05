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
    let hanldeOpenConfirmationPopup: (TodoItem) -> Void
    let handleMarkCompleteTodo: (TodoItem) -> Void
    
    @EnvironmentObject var toastManager: ToastManager
        
    func handleEditTodoItem() {
        print("edit todo item")
    }
   var body: some View {
       HStack(){
           HStack(){
               RadioButton(
                isChecked: todoItem.isCompleted, onClick: {
                    if(!todoItem.isCompleted) {
                        handleMarkCompleteTodo(todoItem)
                    } else {
                        toastManager.error("Already completed!")
                    }
                }
               )
               Text(todoItem.title)
           }
           Spacer()
           HStack(){
               AppIcon(icon: "trash", size: 18, foregroundColor: Color.red, onClick: {
                   hanldeOpenConfirmationPopup(todoItem)
               })
               Divider()
               AppIcon(icon: "pencil", size: 18, foregroundColor: Color.blue, onClick: handleEditTodoItem)
           }
       }.padding().background(Color.white).cornerRadius(8).shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 2).listRowSeparator(.hidden).listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 4, trailing: 16))
    }
}

#Preview {
    TodoItemView(
        todoItem: TodoItem(
            title: "Todo item",
            isCompleted: false,
        ),
        hanldeOpenConfirmationPopup: { item in
            print("delete \(item.title)")
        },
        handleMarkCompleteTodo: { item in
            print("mark-complete \(item.title)")
        }
    )
}

