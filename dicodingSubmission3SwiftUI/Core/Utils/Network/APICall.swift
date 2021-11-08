//
//  NetworkCall.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation

struct API {
    
    static let baseUrl = "https://restaurant-api.dicoding.dev"
    
}

protocol Endpoint {
    
    var url: String { get }
    
}

enum Endpoints {
    
    enum Gets: Endpoint {
        
        case list
        case detail
        case imageSmall
        case imageMedium
        case imageLarge
        
        public var url: String {
            switch self {
            case .list: return "\(API.baseUrl)/list"
            case .detail: return "\(API.baseUrl)/detail/"
            case .imageSmall: return "\(API.baseUrl)/images/small/"
            case .imageMedium: return "\(API.baseUrl)/images/medium/"
            case .imageLarge: return "\(API.baseUrl)/images/large/"
            }
        }
        
    }
    
}
