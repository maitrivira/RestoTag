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
        print("resto repository")
        return self.locale.getRestaurants()
            .map { RestaurantsMapper.mapRestaurantEntitiesToDomains(input: $0) }
            .filter{ !$0.isEmpty }
            .ifEmpty(switchTo: self.remote.getRestaurants()
                        .map { RestaurantsMapper.mapRestaurantResponsesToEntities(input: $0) }
                        .flatMap { self.locale.addRestaurants(from: $0) }
                        .filter { $0 }
                        .flatMap { _ in self.locale.getRestaurants()
                        .map { RestaurantsMapper.mapRestaurantEntitiesToDomains(input: $0) }
                        }
            )
        
    }
    
}
