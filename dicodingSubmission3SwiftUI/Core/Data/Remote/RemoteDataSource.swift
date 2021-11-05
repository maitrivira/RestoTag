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
        print("get remote restaurants")
        return Observable<[RestaurantResponse]>.create { observer in
            if let url = URL(string: Endpoints.Gets.list.url) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: RestaurantsResponse.self) { response in
                        switch response.result {
                        case .success(let value):
                            print("success")
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
    
}
