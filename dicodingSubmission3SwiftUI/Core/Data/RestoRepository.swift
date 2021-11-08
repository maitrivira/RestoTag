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
        print("repo")
        return self.remote.getDetailRestaurant(of: id)
            .map { RestaurantsMapper.mapDetailRestaurantResponsesToDomains(input: $0) }
    }
    
}
