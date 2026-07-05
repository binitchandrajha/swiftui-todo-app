//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Outcode on 27/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var todoList: [TodoItem] = []
    @State private var isBottomSheetModalOpen: Bool = false
    @State private var isDeleteConfirmationModalOpen: Bool = false
    @State private var isMarkCompleteModalOpen: Bool = false
    @State private var selectedTodo: TodoItem? = nil
    
    func handleOpenBottomSheetModal() {
        isBottomSheetModalOpen.toggle()
    }
    func handleOpenDeleteConfirmationModal(item: TodoItem) {
        print(item)
        selectedTodo = item
        isDeleteConfirmationModalOpen.toggle()
    }
    func onAddTodo(todo: TodoItem) {
        todoList.append(todo)
        isBottomSheetModalOpen = false
    }
    func onTodoMarkComplete(todo: TodoItem){
        selectedTodo = todo
        isMarkCompleteModalOpen.toggle()
    }
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                if todoList.isEmpty {
                    EmptyView(
                        onClick: {
                            handleOpenBottomSheetModal()
                        }
                    )
                } else {
                    List(todoList){ list in
                        TodoItemView(todoItem: list, hanldeOpenConfirmationPopup: {
                            item in self.handleOpenDeleteConfirmationModal(item: item)
                        },handleMarkCompleteTodo: { item in
                           onTodoMarkComplete(todo: item)
                        })
                    }.listRowSpacing(10).listStyle(.plain)
                }
               
                Spacer()
            }
            if(!todoList.isEmpty) {
                FabButton(onClick:  handleOpenBottomSheetModal).padding(.trailing, 24).padding(. bottom, 40)
            }
        }
        .overlay{
            if isDeleteConfirmationModalOpen {
                Color.black.opacity(0.3)
                    .onTapGesture {
                        isDeleteConfirmationModalOpen = false
                    }
                ConfirmationPopup(description: "\(selectedTodo?.title ?? "") will be permantently deleted.").padding(16)
            }
            if isMarkCompleteModalOpen {
                Color.black.opacity(0.3)
                    .onTapGesture {
                        isMarkCompleteModalOpen = false
                    }
                ConfirmationPopup(
                                  iconName: "checkmark",
                                  iconColor: Color.green,
                                  headerTitle: "Mark as Complete?",
                                  description: "\(selectedTodo?.title ?? "") will be marked as completed",
                actionButtonTitle: "Complete",
                                  actionButtonBgColor: Color.green,
                                  headerIconBgColor: Color.green.opacity(0.1)
                                  
                ).padding(16)
            }
        }
        .sheet(isPresented: $isBottomSheetModalOpen){
            AddNewTodoView(
                onSaveClick: { item in
                    onAddTodo(todo: item)
                }, onCancelClick: {}
            ).presentationDetents([.height(350)]).presentationBackground(Color.white)
        }
    
    }
}

#Preview {
    ContentView()
}
