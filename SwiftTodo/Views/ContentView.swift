//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Outcode on 27/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var todoList: [TodoItem] = [
        TodoItem(
            title: "TodoItem 1",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 2",
            isCompleted: true
        ),
        TodoItem(
            title: "TodoItem 3",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 4",
            isCompleted: true
        ),
        TodoItem(
            title: "TodoItem 5",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 6",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 7",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 8",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 9",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 10",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 11",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 12",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 13",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 14",
            isCompleted: false
        ),
        TodoItem(
            title: "TodoItem 15",
            isCompleted: false
        )
    ]
    @State private var isBottomSheetModalOpen: Bool = false
    @State private var isDeleteConfirmationModalOpen: Bool = false
    @State private var selectedTodo: TodoItem? = nil
    
    func handleOpenBottomSheetModal() {
        isBottomSheetModalOpen.toggle()
    }
    func handleOpenDeleteConfirmationModal(item: TodoItem) {
        print(item)
        selectedTodo = item
        isDeleteConfirmationModalOpen.toggle()
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                List(todoList){ list in
                    TodoItemView(todoItem: list, hanldeOpenConfirmationPopup: {
                        item in self.handleOpenDeleteConfirmationModal(item: item)
                    })
                }.listRowSpacing(10).listStyle(.plain)
                Spacer()
            }
            FabButton(onClick:  handleOpenBottomSheetModal).padding(.trailing, 24).padding(. bottom, 40)
        }
        .overlay{
            if isDeleteConfirmationModalOpen {
                Color.black.opacity(0.3)
                    .onTapGesture {
                        isDeleteConfirmationModalOpen = false
                    }
                ConfirmationPopup(todoTitle: selectedTodo?.title ?? "").padding(16)
            }
        }
        .sheet(isPresented: $isBottomSheetModalOpen){
            AddNewTodoView().presentationDetents([.height(350)]).presentationBackground(Color.white)
        }
    
    }
}

#Preview {
    ContentView()
}
