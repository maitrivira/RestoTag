//
//  RemoteDataSource.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import Alamofire
import RxSwift

protocol RemoteDataSourceProtocol: AnyObject {
    
    func getRestaurants() -> Observable<[RestaurantResponse]>
    
}

final class RemoteDataSource: NSObject {
    
    private override init() { }
    static let sharedInstance: RemoteDataSource = RemoteDataSource()
    
}

extension RemoteDataSource: RemoteDataSourceProtocol {
    
    func getRestaurants() -> Observable<[RestaurantResponse]> {
        return Observable<[RestaurantResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.list.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RestaurantsResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("success get restaurants")
                            observer.onNext(value.restaurants)
                            observer.onCompleted()
                        case .failure:
                            print("failure")
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
    func getDetailRestaurant(of id: String) -> Observable<RestaurantDetailResponse> {
        return Observable<RestaurantDetailResponse>.create { observer in
            if let url = URL(string: Endpoints.Gets.detail.url + id) {
                print(Endpoints.Gets.detail.url + id)
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RestaurantsDetailResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("success get detail restaurants")
                            observer.onNext(value.restaurant)
                            observer.onCompleted()
                        case .failure:
                            print("failure")
                            observer.onError(URLError.invalidResponse)
                        }
                    }
            }
            return Disposables.create()
        }
    }
    
}
