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
    
    @EnvironmentObject var toastManager: ToastManager
    
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
        toastManager.success("Todo added")
    }
    func onTodoMarkComplete(todo: TodoItem){
        selectedTodo = todo
        isMarkCompleteModalOpen.toggle()
    }
    func confirmMarkComplete(){
        let currentTodoIndex = todoList.firstIndex(where: {$0.id == selectedTodo?.id})
        if let currentTodoIndex = currentTodoIndex {
            todoList[currentTodoIndex].isCompleted.toggle()
        }
        
        isMarkCompleteModalOpen = false
        toastManager.success("Todo marked as complete!")
    }
    func closeDeleteConfirmationModal(){
        isDeleteConfirmationModalOpen = false
    }
    func closeMarkCompleteModal(){
        isMarkCompleteModalOpen = false
    }
    func confirmDeleteTodo(){
        guard let selectedTodo else {return}
        todoList.removeAll{
            $0.id == selectedTodo.id
        }
        isDeleteConfirmationModalOpen = false
        toastManager.success("Todo deleted!")
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
                ConfirmationPopup(description: "\(selectedTodo?.title ?? "") will be permantently deleted.", actionClick: confirmDeleteTodo, cancelClick: closeDeleteConfirmationModal ).padding(16)
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
                                  headerIconBgColor: Color.green.opacity(0.1),
                                  actionClick: confirmMarkComplete,
                                  cancelClick: closeMarkCompleteModal
                                  
                                  
                ).padding(16)
            }
        }
        .overlay(alignment: .top) {
            if let toast = toastManager.toast {
                ToastView(toast: toast)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .animation(.easeInOut, value: toastManager.toast)
                    .padding(.top, 16)
            }
        }
        .onChange(of: toastManager.toast) { _, newToast in
            if newToast != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        toastManager.toast = nil
                    }
                }
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
        .environmentObject(ToastManager())
}
