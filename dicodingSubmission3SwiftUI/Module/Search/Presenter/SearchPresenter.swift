//
//  SearchPresenter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 15/11/21.
//

import SwiftUI
import RxSwift

class SearchPresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let router = RestoRouter()
    private let searchUseCase: SearchUseCase
    
    @Published var restaurants: [RestaurantModel] = []
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    
    var title = ""
    
    init(searchUseCase: SearchUseCase) {
        self.searchUseCase = searchUseCase
    }
    
    func searchResto() {
        loadingState = true
        searchUseCase.getSearch(by: title)
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
