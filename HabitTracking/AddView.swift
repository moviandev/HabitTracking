//
//  AddView.swift
//  HabitTracking
//
//  Created by Matheus Viana on 25/02/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Habit", text: $title)
                
                TextField("Habit Description", text: $description)
            }
            .navigationTitle("Add New Habit")
            .toolbar {
                Button {
                    let newHabit = HabitItem(title: title, description: description)
                    habits.habitItems.append(newHabit)
                    dismiss()
                } label: {
                    Image(systemName: "plus.square.on.square")
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(habits: Habits())
    }
}
