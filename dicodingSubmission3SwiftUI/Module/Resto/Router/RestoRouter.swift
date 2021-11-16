//
//  RestoRouter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

class RestoRouter {
    
    func makeDetailView(for restaurant: RestaurantModel, detailRestaurant: RestaurantDetailModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(restaurant: restaurant, detailRestaurant: detailRestaurant)
        let favUseCase = Injection.init().provideFav()
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        let favPresenter = FavouritePresenter(favUseCase: favUseCase)
        return DetailView(detailPresenter: presenter, favPresenter: favPresenter)
    }
    
    func makeProfile() -> some View {
        let profileUseCase = Injection.init().provideProfile()
        let presenter = ProfilePresenter(profileUseCase: profileUseCase)
        return ProfileView(presenter: presenter)
    }
    
}
