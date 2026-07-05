//
//  AppIcon.swift
//  SwiftTodo
//
//  Created by Outcode on 29/06/2026.
//

import Foundation
import SwiftUI

struct AppIcon: View {
    var icon: String
    var size: CGFloat = 18
    var foregroundColor: Color = Color.red
    var onClick: () -> Void = { }
    var body: some View {
        Button(action : onClick) {
            Image(systemName: icon).font(.system(size: size)).foregroundStyle(foregroundColor)
        }.buttonStyle(.plain)
    }
}

#Preview {
    AppIcon(icon: "trash", size: 18, foregroundColor: Color.red)
}
