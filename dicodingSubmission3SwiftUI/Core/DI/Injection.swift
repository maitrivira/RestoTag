//
//  Injection.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    
    private func provideRepository() -> RestoRepositoryProtocol {
        
        let realm = try? Realm()
        
        let locale: LocaleDataSource = LocaleDataSource.sharedInstance(realm)
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        
        return RestoRepository.sharedInstance(locale, remote)
        
    }
    
    func provideResto() -> RestoUseCase {
        let repository = provideRepository()
        return RestoInteractor(repository: repository)
    }
    
    func provideDetail(restaurant: RestaurantModel, detailRestaurant: RestaurantDetailModel) -> DetailUseCase {
        let repository = provideRepository()
        return DetailInteractor(repository: repository, restaurant: restaurant, detailRestaurant: detailRestaurant)
    }
    
    func provideFav() -> FavouriteUseCase {
        let repository = provideRepository()
        return FavouriteInteractor(repository: repository)
    }
    
}
