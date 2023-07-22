//
//  VideoModel.swift
//  Dances
//
//  Created by Siarhei Samoshyn on 2023-06-09.
//

import SwiftUI

struct Video: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let duration_minutes: String
    let image_large: String
    let image_small: String
    let video_link: String
}
