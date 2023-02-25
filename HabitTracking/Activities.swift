//
//  Activities.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [ActivityItem] = [] {
        didSet {
            let enconder = JSONEncoder()
            
            if let encoded = try? enconder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "activities")
            }
        }
    }
    
    init() {
        if let savedActivities = UserDefaults.standard.data(forKey: "activities") {
            if let decodedActivities = try? JSONDecoder().decode([ActivityItem].self, from: savedActivities) {
                activities = decodedActivities
                return
            }
        }
    }
}
