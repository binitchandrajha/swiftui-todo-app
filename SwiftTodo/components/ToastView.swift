//
//  ToastView.swift
//  SwiftTodo
//
//  Created by Outcode on 05/07/2026.
//


import SwiftUI

struct ToastView: View {
    var toast: ToastData
    
    var bgColor: Color {
        switch toast.type {
        case .success: return Color.green
        case .error:   return Color.red
        case .warning: return Color.orange
        }
    }
    
    var icon: String {
        switch toast.type {
        case .success: return "checkmark.circle.fill"
        case .error:   return "xmark.circle.fill"
        case .warning: return "exclamationmark.triangle.fill"
        }
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.white)
            Text(toast.message)
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .medium))
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(bgColor)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 4)
        .padding(.horizontal, 16)
    }
}