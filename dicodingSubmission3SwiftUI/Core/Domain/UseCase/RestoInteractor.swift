//
//  RestoInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RxSwift

protocol RestoUseCase {
    
    func getRestaurants() -> Observable<[RestaurantModel]>
    
}

class RestoInteractor: RestoUseCase {
    
    private let repository: RestoRepositoryProtocol
    
    required init(repository: RestoRepositoryProtocol) {
        self.repository = repository
    }
    
    func getRestaurants() -> Observable<[RestaurantModel]> {
        return repository.getRestaurants()
    }
    
}
