//
//  RestaurantDetailResponse.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 07/11/21.
//

import Foundation

struct RestaurantsDetailResponse: Decodable {
    
    let restaurant: RestaurantDetailResponse
    
}

struct RestaurantDetailResponse: Decodable {

    private enum CodingKeys: String, CodingKey {
        case id, name, city, address, pictureId, rating, categories, menus, customerReviews
        case descriptions = "description"
    }

    let id: String?
    let name: String?
    let descriptions: String?
    let city: String?
    let address: String?
    let pictureId: String?
    let rating: Double?
    let categories: [Categories]
    let menus: Menus
    let customerReviews: [CustomerReviews]

}

struct Categories: Decodable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    let name: String?
    
}

struct Menus: Decodable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case foods, drinks
    }
    
    let foods: [Foods]
    let drinks: [Drinks]
    
}

struct CustomerReviews: Decodable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case name, review, date
    }
    
    let name: String?
    let review: String?
    let date: String?
    
}

struct Foods: Decodable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    let name: String?
    
}

struct Drinks: Decodable, Hashable {
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    let name: String?
    
}
