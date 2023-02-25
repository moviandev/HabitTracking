//
//  Activities.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities: [ActivityItem] = []
}
