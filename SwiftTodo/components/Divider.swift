//
//  Divider.swift
//  SwiftTodo
//
//  Created by Outcode on 30/06/2026.
//

import Foundation
import SwiftUI

struct Divider : View {
    var body: some View {
        Rectangle().fill(Color.gray.opacity(0.3)).frame(width: 1, height: 24)
    }
}
