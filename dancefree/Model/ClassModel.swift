//
//  ClassModel.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct Class: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let duration_minutes: String
    let image: String
    let videos: [Video]
}
