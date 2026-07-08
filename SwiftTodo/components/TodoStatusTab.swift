//
//  TodoStatusTab.swift
//  SwiftTodo
//
//  Created by Outcode on 06/07/2026.
//

import Foundation
import SwiftUI

struct TodoStatusTab : View {
    var currentStatus: TodoStatus.RawValue = TodoStatus.all.rawValue
    var updateCurrentStatus: (TodoStatus.RawValue) -> Void = { _ in }

    var body: some View {
                HStack {
           StatusFilterTab(
            icon: "list.bullet.clipboard", isSelected: currentStatus == TodoStatus.all.rawValue, label: TodoStatus.all.rawValue,
            iconColor: Color.indigo,
            textColor: Color.indigo,
            click: {status in updateCurrentStatus(status)}
           )
            StatusFilterTab(
                icon: "checkmark.circle.fill", isSelected: currentStatus == TodoStatus.done.rawValue, label: TodoStatus.done.rawValue,
                iconColor: Color.green,
                borderColor: Color.green,
                click: {status in updateCurrentStatus(status)}
            )
            StatusFilterTab(
                icon: "hourglass", isSelected: currentStatus == TodoStatus.pending.rawValue, label: TodoStatus.pending.rawValue,
                iconColor: Color.orange,
                borderColor: Color.orange,
                click: {status in updateCurrentStatus(status)}
            )
        }.background(Color.white).cornerRadius(12).shadow(
            color: .black.opacity(0.2),
            radius: 8,
            x: 0,
            y: 4
        )
    }
}

#Preview {
    TodoStatusTab()
}
