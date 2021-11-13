//
//  LocaleRepository.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RealmSwift
import RxSwift

protocol LocaleDataSourceProtocol: AnyObject {
    
    func getRestaurants() -> Observable<[RestaurantEntity]>
    func addRestaurants(of restaurants: [RestaurantEntity]) -> Observable<Bool>
    
}

final class LocaleDataSource: NSObject {
    
    private let realm: Realm?
    
    private init(realm: Realm?) {
        self.realm = realm
    }
    
    static let sharedInstance: (Realm?) -> LocaleDataSource = { realmDatabase in
        return LocaleDataSource(realm: realmDatabase)
    }
    
}

extension LocaleDataSource: LocaleDataSourceProtocol {
    
    func getRestaurants() -> Observable<[RestaurantEntity]> {
        return Observable<[RestaurantEntity]>.create { observer in
            if let realm = self.realm {
                let restaurants: Results<RestaurantEntity> = {
                    realm.objects(RestaurantEntity.self)
                        .sorted(byKeyPath: "id", ascending: true)
                }()
                observer.onNext(restaurants.toArray(ofType: RestaurantEntity.self))
                observer.onCompleted()
            } else {
                observer.onError(DatabaseError.requestFailed)
            }
            return Disposables.create()
        }
    }
    
    func addRestaurants(of restaurants: [RestaurantEntity]) -> Observable<Bool> {
        return Observable<Bool>.create { observer in
            if let realm = self.realm {
                do {
                    try realm.write {
                        for restaurant in restaurants {
                            realm.add(restaurant, update: .all)
                        }
                        observer.onNext(true)
                        observer.onCompleted()
                    }
                } catch {
                    observer.onError(DatabaseError.requestFailed)
                }
            } else {
                observer.onError(DatabaseError.invalidInstance)
            }
            return Disposables.create()
        }
    }
    
}

extension Results {
    
    func toArray<T>(ofType: T.Type) -> [T] {
        var array = [T]()
        for index in 0..<count {
            if let result = self[index] as? T {
                array.append(result)
            }
        }
        return array
    }
    
}
