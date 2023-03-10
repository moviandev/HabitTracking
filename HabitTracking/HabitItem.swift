//
//  Activity.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

struct HabitItem: Identifiable, Codable, Equatable {
    var id: UUID = UUID()
    let title: String
    let description: String
    var completionCounter: Int = 0
    
    mutating func incrementCompletionCycle() {
        completionCounter += 1
    }
}
