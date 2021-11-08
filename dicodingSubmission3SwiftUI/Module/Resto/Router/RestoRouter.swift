//
//  RestoRouter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

class RestoRouter {
    
    func makeDetailView(for restaurants: RestaurantModel, detailRestaurant: RestaurantDetailModel) -> some View {
        let detailUseCase = Injection.init().provideDetail(restaurant: restaurants, detailRestaurant: detailRestaurant)
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
}
