//
//  SearchInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 15/11/21.
//

import SwiftUI
import RxSwift

protocol SearchUseCase {
    
    func getSearch(by title: String) -> Observable<[RestaurantModel]>
    
}

class SearchInteractor: SearchUseCase {
    
    private let repository: RestoRepositoryProtocol
    
    required init(repository: RestoRepositoryProtocol) {
        self.repository = repository
    }
    
    func getSearch(by title: String) -> Observable<[RestaurantModel]> {
        return repository.getSearchRestaurant(by: title)
    }
    
}
