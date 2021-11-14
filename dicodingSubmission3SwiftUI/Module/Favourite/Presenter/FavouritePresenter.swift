//
//  FavouritePresenter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 14/11/21.
//

import SwiftUI
import RxSwift

class FavouritePresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let router = RestoRouter()
    private var favUseCase: FavouriteUseCase
    
    @Published var restaurants: [RestaurantModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    init(favUseCase: FavouriteUseCase) {
        self.favUseCase = favUseCase
    }
    
    func containsId(of id: String) -> Bool {
        let data = restaurants.contains { $0.id == id }
        return data
    }
    
    func getFavourite() {
        loadingState = true
        favUseCase.getFavourite()
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.restaurants = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func linkBuilder<Content: View>(
        for restaurant: RestaurantModel,
        detailRestaurant: RestaurantDetailModel,
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink( destination: router.makeDetailView(for: restaurant, detailRestaurant: detailRestaurant)) { content() }
    }
    
}
