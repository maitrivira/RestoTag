//
//  RestoPresenter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI
import RxSwift

class RestoPresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let router = RestoRouter()
    private let restoUseCase: RestoUseCase
    
    @Published var restaurants: [RestaurantModel] = []
    @Published var restaurantsRemote: [RestaurantResponse] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false

    init(restoUseCase: RestoUseCase) {
        self.restoUseCase = restoUseCase
    }
    
    func getRestaurants() {
        loadingState = true
        restoUseCase.getRestaurants()
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
    
    func linkPerson<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationLink(destination: router.makeProfile) { content() }
    }
    
}
