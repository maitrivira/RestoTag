//
//  Model.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation

struct RestaurantModel: Equatable, Identifiable {
    
    let id: String
    let name: String
    let descriptions: String
    let pictureId: String
    let city: String
    let rating: Double
    
}
