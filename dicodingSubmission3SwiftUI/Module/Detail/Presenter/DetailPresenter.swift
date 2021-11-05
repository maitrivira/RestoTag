//
//  DetailPresenter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

class DetailPresenter: ObservableObject {
    
    private let detailUseCase: DetailUseCase
    
    @Published var restaurants: RestaurantModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        restaurants = detailUseCase.getRestaurants()
    }
    
}
