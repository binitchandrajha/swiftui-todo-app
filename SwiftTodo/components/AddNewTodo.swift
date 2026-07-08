//
//  AddNewTodo.swift
//  SwiftTodo
//
//  Created by Outcode on 03/07/2026.
//

import Foundation
import SwiftUI

struct AddNewTodoView: View {
    @Binding var task: String
    var todoItem: TodoItem? = nil
    let onSaveClick: (TodoItem) -> Void
    let onCancelClick: () -> Void
    var isEditMode: Bool = false
    var body: some View {
        VStack{
            Text(isEditMode ? "Update Todo" : "Add New Todo").font(.system(size: 20, weight: .bold))
            Spacer().frame(height: 20)
            InputFeild(
                text: $task
            ).padding(.horizontal, 16)
            Spacer().frame(height: 40)
            PrimaryButton(action: {
                if !isEditMode {
                    let todoItem = TodoItem(title: task, isCompleted: false)
                    onSaveClick(todoItem)
                    task = ""
                } else if let todoItem {
                    let updatedTodoItem = TodoItem(id: todoItem.id, title: task, isCompleted: todoItem.isCompleted)
                    onSaveClick(updatedTodoItem)
                    task = ""
                }
            }, label: isEditMode ? "Update" : "Save")
            
            Spacer().frame(height: 20)
            
            PrimaryButton(action: onCancelClick, label: "Cancel", backgroundColor: .clear,
                          textColor: .gray,showShadow: false)
        }
    }
}

#Preview {
    let todoItem = TodoItem(
        title: "New Todo", isCompleted: false
    )
    AddNewTodoView(
        task: .constant(""),
        onSaveClick: { todoItem in
            print("\(todoItem)")
        }, onCancelClick: {},
        isEditMode: false
    )
}
