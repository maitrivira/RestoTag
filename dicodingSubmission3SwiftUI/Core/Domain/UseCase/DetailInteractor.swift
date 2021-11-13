//
//  DetailInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RxSwift
import RxRelay

protocol DetailUseCase {
    
    func getRestaurant() -> RestaurantModel
    func getDetailRestaurant(of id: String) -> Observable<RestaurantDetailModel>
    func getDetailRestaurantFromModel() -> RestaurantDetailModel
    func addDetailRestaurant(of data: [RestaurantEntity]) -> BehaviorRelay<Bool>
    
}

class DetailInteractor: DetailUseCase {
    
    private let repository: RestoRepositoryProtocol
    private let restaurant: RestaurantModel
    private let detailRestaurant: RestaurantDetailModel
    private var saveDetailRestaurant = BehaviorRelay<Bool>(value: false)
    
    required init(
        repository: RestoRepositoryProtocol,
        restaurant: RestaurantModel,
        detailRestaurant: RestaurantDetailModel
    ) {
        self.repository = repository
        self.restaurant = restaurant
        self.detailRestaurant = detailRestaurant
    }
    
    func getRestaurant() -> RestaurantModel {
        return restaurant
    }
    
    func getDetailRestaurant(of id: String) -> Observable<RestaurantDetailModel> {
        return repository.getDetailRestaurant(of: id)
    }
    
    func getDetailRestaurantFromModel() -> RestaurantDetailModel {
        return detailRestaurant
    }
    
    func addDetailRestaurant(of data: [RestaurantEntity]) -> BehaviorRelay<Bool> {
        return saveDetailRestaurant
    }
    
}
