//
//  ToastManager.swift
//  SwiftTodo
//
//  Created by Outcode on 05/07/2026.
//

import Foundation
import SwiftUI
import Combine

final class ToastManager: ObservableObject {

    @Published var toast: ToastData?

    func success(_ message: String) {
        toast = ToastData(
            message: message,
            type: .success
        )
    }

    func error(_ message: String) {
        toast = ToastData(
            message: message,
            type: .error
        )
    }
}
