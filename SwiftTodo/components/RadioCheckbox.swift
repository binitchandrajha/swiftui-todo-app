//
//  RadioCheckbox.swift
//  SwiftTodo
//
//  Created by Outcode on 29/06/2026.
//

import Foundation
import SwiftUI

struct RadioButton: View {
    var isChecked: Bool
    var onClick: () -> Void
    var body: some View {
        Button(action: onClick) {
            AppIcon(icon: isChecked ? "checkmark.circle.fill" : "circle", size: 32, foregroundColor: Color.blue)
        }
    }
}

#Preview {
    RadioButton(isChecked: false, onClick: {})
}
