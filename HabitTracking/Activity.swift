//
//  Activity.swift
//  HabitTracking
//
//  Created by Matheus Viana on 24/02/23.
//

import Foundation

struct Activity: Identifiable, Codable {
    var id: UUID = UUID()
    let title: String
    let description: String
}
