//
//  DetailInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation

protocol DetailUseCase {
    
    func getRestaurants() -> RestaurantModel
    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: RestoRepositoryProtocol
    private let restaurant: RestaurantModel
    
    required init(
        repository: RestoRepositoryProtocol,
        restaurant: RestaurantModel
    ) {
        self.repository = repository
        self.restaurant = restaurant
    }
    
    func getRestaurants() -> RestaurantModel {
        return restaurant
    }
    
}
