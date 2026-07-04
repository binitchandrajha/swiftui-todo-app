//
//  EmptyView.swift
//  SwiftTodo
//
//  Created by Outcode on 04/07/2026.
//

import Foundation
import SwiftUI

struct EmptyView: View {
    let onClick: () -> Void
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 12) {
                Image(systemName: "checklist").font(.system(size: 60)).foregroundStyle(Color.gray.opacity(0.5))
                Text("No Todos Yet!")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.gray)
                PrimaryButton(
                    action: onClick, label: "No worries, let's get started!"
                )
            }
            Spacer()
            
        }
    }
}

#Preview {
    EmptyView(
        onClick: {}
    )
}
