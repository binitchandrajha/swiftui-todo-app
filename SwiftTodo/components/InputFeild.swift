//
//  InputFeild.swift
//  SwiftTodo
//
//  Created by Outcode on 04/07/2026.
//

import Foundation
import SwiftUI

struct InputFeild: View {
    @Binding var text: String
    
    var body: some View {
        TextField("Add a new task", text: $text).frame(minHeight: 50).padding(.horizontal, 16).overlay(RoundedRectangle(cornerRadius: 10).stroke(.indigo, lineWidth: 1))
    }
}

#Preview {
    InputFeild(text: .constant(""))
}
