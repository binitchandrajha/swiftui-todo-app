//
//  TodoItem.swift
//  SwiftTodo
//
//  Created by Outcode on 28/06/2026.
//

import Foundation

struct TodoItem: Identifiable {
 let id: UUID = UUID()
 var title: String
 var isCompleted: Bool
}
