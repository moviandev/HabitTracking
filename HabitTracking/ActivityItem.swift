//
//  Activity.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

struct ActivityItem: Identifiable, Codable {
    var id: UUID = UUID()
    let title: String
    let description: String
    var completionCounter: Int
}
