//
//  FabButton.swift
//  SwiftTodo
//
//  Created by Outcode on 30/06/2026.
//

import Foundation
import SwiftUI

struct FabButton: View {
    var onClick: () -> Void
    var body: some View {
        Button(action: onClick){
            Image(systemName: "plus").frame(width: 56, height: 56).background(Color.indigo).clipShape(Circle()).foregroundStyle(Color.white).font(.system(size: 24))
        }
    }
}

#Preview {
    FabButton(onClick:  { })
}
