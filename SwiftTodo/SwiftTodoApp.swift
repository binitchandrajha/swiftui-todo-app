//
//  SwiftTodoApp.swift
//  SwiftTodo
//
//  Created by Outcode on 27/06/2026.
//

import SwiftUI

@main
struct SwiftTodoApp: App {
    @StateObject private var toastManager = ToastManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(toastManager)
        }
    }
}
