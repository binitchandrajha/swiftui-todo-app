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
        AppIcon(icon: isChecked ? "checkmark.circle.fill" : "circle", size: 32, foregroundColor: Color.blue, onClick: {
            print("mark complete triggeredd...")
            onClick()
        })
    }
}

#Preview {
    RadioButton(isChecked: false, onClick: {})
}
