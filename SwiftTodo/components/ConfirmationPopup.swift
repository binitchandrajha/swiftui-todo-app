//
//  ConfirmationPopup.swift
//  SwiftTodo
//
//  Created by Outcode on 04/07/2026.
//

import Foundation
import SwiftUI

struct ConfirmationPopup : View {
    var iconName : String = "trash"
    var iconColor: Color = Color.red
    var headerTitle: String = "Delete Todo?"
    var description: String = ""
    var actionButtonTitle: String = "Delete"
    var actionButtonBgColor: Color = Color.red
    var headerIconBgColor: Color = Color.red.opacity(0.1)
    let actionClick: () -> Void
    let cancelClick: () -> Void
    var body: some View {
            VStack {
                Circle().fill(headerIconBgColor).frame(width: 70, height: 70).overlay(
                    Image(systemName: iconName).font(.system(size: 24,weight: .semibold)).foregroundStyle(iconColor)
                )
                Spacer().frame(height: 20)
                Text(headerTitle).font(.system(size: 18,weight: .bold))
                Spacer().frame(height: 20)
                if (!description.isEmpty) {
                    Text(description)
                }
                Spacer().frame(height: 40)
                HStack {
                    PrimaryButton(
                        action: cancelClick,
                        label: "Cancel",
                        backgroundColor: .clear,
                        textColor: Color.gray,
                        showShadow: false,
                        borderColor: Color.gray.opacity(0.7),
                        borderWidth: 1,
                        
                    )
                    PrimaryButton(
                        action: actionClick,
                        label: actionButtonTitle,
                        backgroundColor: actionButtonBgColor,
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
        description: "Are you sure want to delete this todo?",
        actionClick: {},
        cancelClick: {}
    )
}
