//
//  RestoRepository.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RxSwift

protocol RestoRepositoryProtocol {
    
    func getRestaurants() -> Observable<[RestaurantModel]>
    func getDetailRestaurant(of id: String) -> Observable<RestaurantDetailModel>
    func getFavouriteRestaurant() -> Observable<[RestaurantModel]>
    func addDetailRestaurant(of data: RestaurantModel) -> Observable<Bool>
    func deleteDetailRestaurant(of data: RestaurantModel) -> Observable<Bool>
    func getSearchRestaurant(by title: String) -> Observable<[RestaurantModel]>
    
}

final class RestoRepository: NSObject {
    
    typealias RestoInstance = (LocaleDataSource, RemoteDataSource) -> RestoRepository
    
    fileprivate let remote: RemoteDataSource
    fileprivate let locale: LocaleDataSource
    
    private init(locale: LocaleDataSource, remote: RemoteDataSource) {
        self.locale = locale
        self.remote = remote
    }
    
    static let sharedInstance: RestoInstance = { localeRepo, remoteRepo in
        return RestoRepository(locale: localeRepo, remote: remoteRepo)
    }
    
}

extension RestoRepository: RestoRepositoryProtocol {
    
    func getRestaurants() -> Observable<[RestaurantModel]> {
        return self.remote.getRestaurants()
            .map { RestaurantsMapper.mapRestaurantResponsesToDomains(input: $0) }
    }
    
    func getDetailRestaurant(of id: String) -> Observable<RestaurantDetailModel> {
        return self.remote.getDetailRestaurant(of: id)
            .map { RestaurantsMapper.mapDetailRestaurantResponsesToDomains(input: $0) }
    }
    
    func getFavouriteRestaurant() -> Observable<[RestaurantModel]> {
        return self.locale.getRestaurants()
            .map { RestaurantsMapper.mapRestaurantEntitiesToDomains(input: $0) }
    }
    
    func addDetailRestaurant(of data: RestaurantModel) -> Observable<Bool> {
        return self.locale.addRestaurants(of: RestaurantsMapper.mapRestaurantModelToEntities(input: data))
    }
    
    func deleteDetailRestaurant(of data: RestaurantModel) -> Observable<Bool> {
        return self.locale.deleteRestaurant(of: RestaurantsMapper.mapRestaurantModelToEntities(input: data))
    }
    
    func getSearchRestaurant(by title: String) -> Observable<[RestaurantModel]> {
        return self.remote.getSearchRestaurants(by: title)
            .map { RestaurantsMapper.mapRestaurantResponsesToDomains(input: $0) }
    }
    
}
