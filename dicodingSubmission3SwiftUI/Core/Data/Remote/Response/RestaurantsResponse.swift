//
//  ListResponse.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation

struct RestaurantsResponse: Decodable {
    
    let restaurants: [RestaurantResponse]
    
}

struct RestaurantResponse: Decodable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case descriptions = "description"
        case pictureId = "pictureId"
        case city = "city"
        case rating = "rating"
    }
    
    let id: String?
    let name: String?
    let descriptions: String?
    let pictureId: String?
    let city: String?
    let rating: Double?
    
}
