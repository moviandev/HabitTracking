//
//  HabitView.swift
//  HabitTracking
//
//  Created by Matheus Viana on 25/02/23.
//

import SwiftUI

struct HabitView: View {
    var habit: HabitItem
    var habits: Habits
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(habit.description)
                } header: {
                    Text("Habit Description")
                }
                
                Section {
                    Text(habit.completionCounter, format: .number)
                } header: {
                    Text("Checks on this habit")
                }
            }
        }
        .navigationTitle(habit.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Done: \(habit.completionCounter)") {
                habits.incrementHabitCompletion(habit)
            }
        }
    }
}

struct HabitView_Previews: PreviewProvider {
    static let habitSample = HabitItem(title: "Lorem ipsum dolor", description: """
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
""")
    
    static let habitsSample = Habits()
    
    static var previews: some View {
        HabitView(habit: habitSample, habits: habitsSample)
    }
}
