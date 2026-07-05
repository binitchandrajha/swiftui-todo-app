//
//  AddNewTodo.swift
//  SwiftTodo
//
//  Created by Outcode on 03/07/2026.
//

import Foundation
import SwiftUI

struct AddNewTodoView: View {
    @State private var task = ""
    let onSaveClick: (TodoItem) -> Void
    let onCancelClick: () -> Void
    var body: some View {
        VStack{
            Text("Add New Todo").font(.system(size: 20, weight: .bold))
            Spacer().frame(height: 20)
            InputFeild(
                text: $task
            ).padding(.horizontal, 16)
            Spacer().frame(height: 40)
            PrimaryButton(action: {
                let todoItem = TodoItem(title: task, isCompleted: false)
                onSaveClick(todoItem)
                task = ""
            }, label: "Save")
            
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
        onSaveClick: { todoItem in
            print("\(todoItem)")
        }, onCancelClick: {}
    )
}
