//
//  RestaurantEntity.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import Foundation
import RealmSwift

class RestaurantEntity: Object {
    
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descriptions: String = ""
    @objc dynamic var pictureId: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var rating: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
