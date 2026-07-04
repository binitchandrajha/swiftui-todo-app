//
//  ConfirmationPopup.swift
//  SwiftTodo
//
//  Created by Outcode on 04/07/2026.
//

import Foundation
import SwiftUI

struct ConfirmationPopup : View {
    var todoTitle: String
    var body: some View {
            VStack {
                Circle().fill(Color.red.opacity(0.1)).frame(width: 70, height: 70).overlay(
                    Image(systemName: "trash").font(.system(size: 24,weight: .semibold)).foregroundStyle(.red)
                )
                Spacer().frame(height: 20)
                Text("Delete Todo?").font(.system(size: 18,weight: .bold))
                Spacer().frame(height: 20)
                Text("\(todoTitle) will be permantently deleted.")
                Spacer().frame(height: 40)
                HStack {
                    PrimaryButton(
                        action: {},
                        label: "Cancel",
                        backgroundColor: .clear,
                        textColor: Color.gray,
                        showShadow: false,
                        borderColor: Color.gray.opacity(0.7),
                        borderWidth: 1,
                        
                    )
                    PrimaryButton(
                        action: {},
                        label: "Delete",
                        backgroundColor: Color.red,
                        showShadow: false,
                    )
                }
            }
            .padding(24)
            .background(Color.white)
            .cornerRadius(16)
        }
}

#Preview {
    ConfirmationPopup(
        todoTitle: "Buy milk"
    )
}
