//
//  ContentView.swift
//  SwiftTodo
//
//  Created by Outcode on 27/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var todoList: [TodoItem] = []
    @State private var filteredTodoList: [TodoItem] = []
    @State private var isBottomSheetModalOpen: Bool = false
    @State private var isDeleteConfirmationModalOpen: Bool = false
    @State private var isMarkCompleteModalOpen: Bool = false
    @State private var selectedTodo: TodoItem? = nil
    @State private var isEditMode: Bool = false
    @State private var task = ""
    @State private var currentTodoStatus: TodoStatus.RawValue = TodoStatus.all.rawValue
    
    
    @EnvironmentObject var toastManager: ToastManager
    
    func handleOpenBottomSheetModal() {
        isBottomSheetModalOpen.toggle()
        task = ""
        isEditMode = false
    }
    func handleOpenDeleteConfirmationModal(item: TodoItem) {
        print(item)
        selectedTodo = item
        isDeleteConfirmationModalOpen.toggle()
    }
    func onAddTodo(todo: TodoItem) {
        if(isEditMode){
            let currentIndex = todoList.firstIndex(where: {$0.id == selectedTodo?.id})
            if let currentIndex = currentIndex {
                todoList[currentIndex] = todo
            }
            handleFilteredTodoStatus()
            isBottomSheetModalOpen = false
            isEditMode = false
            toastManager.success("Todo updated")
        } else{
            todoList.append(todo)
            handleFilteredTodoStatus()
            isBottomSheetModalOpen = false
            toastManager.success("Todo added")
        }
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
        handleFilteredTodoStatus()
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
        handleFilteredTodoStatus()
        toastManager.success("Todo deleted!")
    }
    func handleSetEditMode(item: TodoItem){
        isEditMode = true
        isBottomSheetModalOpen = true
        selectedTodo = item
        task = item.title
    }
    func handleUpdateTodoStatus(updatedTodoStatus: TodoStatus.RawValue){
        currentTodoStatus = updatedTodoStatus
        handleFilteredTodoStatus()
    }
    func handleFilteredTodoStatus(){
        if(currentTodoStatus == TodoStatus.all.rawValue){
            filteredTodoList = todoList
        } else if(currentTodoStatus == TodoStatus.pending.rawValue){
            filteredTodoList = todoList.filter({!$0.isCompleted})
        } else {
            filteredTodoList = todoList.filter({$0.isCompleted})
        }
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
                    TodoStatusTab(
                        currentStatus: currentTodoStatus,
                        updateCurrentStatus: {status in  self.handleUpdateTodoStatus(updatedTodoStatus: status)}
                    )
                    Spacer().frame(height: 10)
                    if filteredTodoList.isEmpty && currentTodoStatus == TodoStatus.pending.rawValue{
                        Text("No pending Todos").padding(16)
                    } else if(filteredTodoList.isEmpty && currentTodoStatus == TodoStatus.done.rawValue){
                        Text("No completed Todos").padding(16)
                    } else {
                        List(filteredTodoList){ list in
                            TodoItemView(todoItem: list, hanldeOpenConfirmationPopup: {
                                item in self.handleOpenDeleteConfirmationModal(item: item)
                            },handleMarkCompleteTodo: { item in
                               onTodoMarkComplete(todo: item)
                            }, handleClickEditIcon: { item in
                                handleSetEditMode(item: item)
                            })
                        }.listRowSpacing(10).listStyle(.plain)
                    }
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
                task: $task,
                todoItem: selectedTodo,
                onSaveClick: { item in
                    onAddTodo(todo: item)
                }, onCancelClick: {
                    isBottomSheetModalOpen = false
                    task = ""
                },
                isEditMode: isEditMode,
            ).presentationDetents([.height(350)]).presentationBackground(Color.white)
        }
    
    }
}

#Preview {
    ContentView()
        .environmentObject(ToastManager())
}
