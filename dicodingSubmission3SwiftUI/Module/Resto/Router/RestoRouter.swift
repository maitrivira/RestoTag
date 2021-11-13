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
        let presenter = DetailPresenter(detailUseCase: detailUseCase)
        return DetailView(presenter: presenter)
    }
    
}
