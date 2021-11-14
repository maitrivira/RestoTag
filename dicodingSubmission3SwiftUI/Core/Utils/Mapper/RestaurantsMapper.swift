//
//  CategoryMapper.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 03/11/21.
//

final class RestaurantsMapper {
    
    static func mapRestaurantResponsesToEntities(
        input restaurantResponses: [RestaurantResponse]
    ) -> [RestaurantEntity] {
        return restaurantResponses.map { result in
            let newRestaurant = RestaurantEntity()
            newRestaurant.id = result.id ?? ""
            newRestaurant.name = result.name ?? ""
            newRestaurant.descriptions = result.descriptions ?? ""
            newRestaurant.pictureId = result.pictureId ?? ""
            newRestaurant.city = result.city ?? ""
            newRestaurant.rating = result.rating ?? 0.0
            return newRestaurant
        }
    }
    
    static func mapRestaurantModelToEntities(
        input restaurantModel: RestaurantModel
    ) -> [RestaurantEntity] {
        let newRestaurant = RestaurantEntity()
        newRestaurant.id = restaurantModel.id
        newRestaurant.name = restaurantModel.name
        newRestaurant.descriptions = restaurantModel.descriptions
        newRestaurant.pictureId = restaurantModel.pictureId
        newRestaurant.city = restaurantModel.city
        newRestaurant.rating = restaurantModel.rating
        return [newRestaurant]
    }
    
    static func mapRestaurantEntitiesToDomains(
        input restaurantEntities: [RestaurantEntity]
    ) -> [RestaurantModel] {
        return restaurantEntities.map { result in
            return RestaurantModel(
                id: result.id,
                name: result.name,
                descriptions: result.descriptions,
                pictureId: result.pictureId,
                city: result.city,
                rating: result.rating
            )
        }
    }
    
    static func mapRestaurantResponsesToDomains(
        input restaurantResponses: [RestaurantResponse]
    ) -> [RestaurantModel] {
        
        return restaurantResponses.map { result in
            return RestaurantModel(
                id: result.id ?? "",
                name: result.name ?? "",
                descriptions: result.descriptions ?? "",
                pictureId: result.pictureId ?? "",
                city: result.city ?? "",
                rating: result.rating ?? 0.0
            )
        }
        
    }
    
    static func mapDetailRestaurantResponsesToDomains(
        input restaurantDetailResponses: RestaurantDetailResponse
    ) -> RestaurantDetailModel {

        return RestaurantDetailModel(
            id: restaurantDetailResponses.id ?? "",
            name: restaurantDetailResponses.name ?? "",
            descriptions: restaurantDetailResponses.descriptions ?? "",
            city: restaurantDetailResponses.city ?? "",
            address: restaurantDetailResponses.address ?? "",
            pictureId: restaurantDetailResponses.pictureId ?? "",
            rating: restaurantDetailResponses.rating ?? 0.0,
            categories: restaurantDetailResponses.categories,
            menus: restaurantDetailResponses.menus,
            customerReviews: restaurantDetailResponses.customerReviews
        )
        
    }
    
}
