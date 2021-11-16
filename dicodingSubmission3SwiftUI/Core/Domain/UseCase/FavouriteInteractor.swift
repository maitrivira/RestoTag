//
//  FavouriteInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 14/11/21.
//

import Foundation
import RxSwift

protocol FavouriteUseCase {
    
    func getFavourite() -> Observable<[RestaurantModel]>
    
}

class FavouriteInteractor: FavouriteUseCase {
    
    private let repository: RestoRepositoryProtocol
    
    required init(repository: RestoRepositoryProtocol) {
        self.repository = repository
    }
    
    func getFavourite() -> Observable<[RestaurantModel]> {
        return repository.getFavouriteRestaurant()
    }

}
