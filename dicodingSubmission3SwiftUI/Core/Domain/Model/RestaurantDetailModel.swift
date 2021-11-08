//
//  RestaurantDetailModel.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 07/11/21.
//

import Foundation
import Alamofire

struct RestaurantDetailModel: Decodable {
    
    let id: String
    let name: String
    let descriptions: String
    let city: String
    let address: String
    let pictureId: String
    let rating: Double
    let categories: [Categories]
    let menus: Menus
    let customerReviews: [CustomerReviews]
    
}

let dummyData = RestaurantDetailModel(id: "Contoh", name: "Contoh", descriptions: "Contoh", city: "Contoh", address: "Contoh", pictureId: "Contoh", rating: 0.0, categories: [], menus: menus, customerReviews: [])

let menus = Menus(foods: [], drinks: [])
