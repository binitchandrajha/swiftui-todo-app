//
//  PrimaryButton.swift
//  SwiftTodo
//
//  Created by Outcode on 04/07/2026.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let action: () -> Void
    let label: String
    var backgroundColor: Color = .indigo
    var textColor: Color = .white
    var showShadow: Bool = true
    var borderColor: Color = .clear
    var borderWidth: CGFloat = 0
    
    var body: some View {
        Button(action: action) {
            Text(label).foregroundStyle(textColor).font(.system(size: 18, weight: .bold))
        }
        .buttonStyle(.plain).frame(maxWidth: .infinity, minHeight: 60).background(backgroundColor).cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderColor, lineWidth: borderWidth))
        .shadow(color: showShadow ? .indigo.opacity(0.4) : .clear, radius: 8, x: 0, y: 4).padding(.horizontal, 16)
    }
}

#Preview {
    PrimaryButton(action: {}, label: "Label")
}
