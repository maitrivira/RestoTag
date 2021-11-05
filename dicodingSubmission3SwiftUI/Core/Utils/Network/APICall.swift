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
        
        public var url: String {
            switch self {
            case .list: return "\(API.baseUrl)/list"
            }
        }
        
    }
    
}
