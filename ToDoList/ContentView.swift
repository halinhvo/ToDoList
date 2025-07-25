//
//  ContentView.swift
//  ToDoList
//
//  Created by Scholar on 7/25/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query private var Tasks: [ToDoStuff]
    @Environment(\.modelContext) private var context
    
    @State private var newTask = ""
    @State private var selectedTask: ToDoStuff?
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Text("To-Do List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                List {
                    
                    ForEach(Tasks) { Task in
                        HStack {
                            
                            Text(Task.task)
                            
                        }
                       
//                        .onTapGesture {
//                            selectedTask = Task
//                            
//                        }
                        
                    }
                    
                }
                
            }
       
        .navigationBarHidden(true)
            
        }
        
        .safeAreaInset(edge: .bottom) {
            
            VStack(alignment: .center, spacing: 20.0) {
            
                Text("Add Task")
                    .font(.headline)
                TextField("Enter Task's Name", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                Button("Save") {
                    
                    let newItem = ToDoStuff(task: newTask)
                    context.insert(newItem)
                    
                    newTask = ""
                    
                }
                
                .bold()
                
            }
            .padding()
            .background(.bar)
            
        }
        
        
        
    }
}

#Preview {
    
    ContentView()
        .modelContainer(for: ToDoStuff.self, inMemory: true)

}
