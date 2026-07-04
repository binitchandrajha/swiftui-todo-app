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
    var body: some View {
        VStack{
            Text("Add New Todo").font(.system(size: 20, weight: .bold))
            Spacer().frame(height: 20)
            InputFeild(
                text: $task
            ).padding(.horizontal, 16)
            Spacer().frame(height: 40)
            PrimaryButton(action: {}, label: "Save")
            
            Spacer().frame(height: 20)
            
            PrimaryButton(action: {}, label: "Cancel", backgroundColor: .clear,
                          textColor: .gray,showShadow: false)
        }
    }
}

#Preview {
    AddNewTodoView()
}
