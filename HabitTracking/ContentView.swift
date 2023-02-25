//
//  ContentView.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.activitiesItem) { habit in
                    NavigationLink {
                        Text("\(habit.id)")
                    } label: {
                        HStack {
                            Text(habit.title)
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            Text("|")
                                .foregroundStyle(.secondary)
                            
                            Text("Completed: \(habit.completionCounter)")
                                .font(.headline)
                                .foregroundColor(.primary.opacity(0.5))
                        }
                    }
                }
                .onDelete { indexSet in
                    activities.activitiesItem.remove(atOffsets: indexSet)
                }
                
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    EditButton()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        showingAddHabit = true
                    } label: {
                        Image(systemName: "plus.app")
                    }
                }
            }
            .sheet(isPresented: $showingAddHabit) {
                AddView(activities: activities)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
