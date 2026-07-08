//
//  TodoItem.swift
//  SwiftTodo
//
//  Created by Outcode on 28/06/2026.
//

import Foundation

struct TodoItem: Identifiable {
    let id: UUID
    var title: String
    var isCompleted: Bool

    init(
        id: UUID = UUID(),
        title: String,
        isCompleted: Bool
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
}
