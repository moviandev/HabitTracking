//
//  Activities.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var habitItems: [HabitItem] = [] {
        didSet {
            let enconder = JSONEncoder()
            
            if let encoded = try? enconder.encode(habitItems) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "activities") {
            if let decodedHabits = try? JSONDecoder().decode([HabitItem].self, from: savedHabits) {
                habitItems = decodedHabits
                return
            }
        }
    }
    
    func incrementHabitCompletion(_ habit: HabitItem) {
        if let i = habitItems.firstIndex(of: habit) {
            habitItems[i].incrementCompletionCycle()
            habitItems = habitItems
        }
    }
}
