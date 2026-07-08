//
//  StatusFilterTab.swift
//  SwiftTodo
//
//  Created by Outcode on 06/07/2026.
//

import Foundation
import SwiftUI

struct StatusFilterTab: View {
    var icon: String
    var isSelected: Bool = false
    var label: String
    var iconColor: Color = .primary
    var textColor: Color = .primary
    var borderColor: Color = .indigo
    var click: (TodoStatus.RawValue) -> Void
    var body: some View {
        Button(action: {
            click(label)
        }){
            HStack {
                Image(systemName: icon).font(.system(size: 24)).foregroundStyle(iconColor)
                Text(label).foregroundStyle(textColor)
            }.padding(12)
        }.buttonStyle(.plain).overlay(
           alignment: .bottom
        ) {
           if isSelected {
               Rectangle()
                   .fill(borderColor)
                   .frame(height: 2)
            }
        }.padding(12)
    }
}

#Preview {
    StatusFilterTab(
        icon: "list.bullet.clipboard", isSelected: true, label: "All", click: { status in
            print(status)
        }
    )
}
