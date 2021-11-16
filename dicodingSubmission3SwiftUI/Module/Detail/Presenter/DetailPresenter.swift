//
//  DetailPresenter.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI
import RxSwift

class DetailPresenter: ObservableObject {
    
    private let disposeBag = DisposeBag()
    private let detailUseCase: DetailUseCase
    
    @Published var restaurant: RestaurantModel
    @Published var errorMessage: String = ""
    @Published var loadingState: Bool = false
    @Published var detailRestaurant: RestaurantDetailModel
    @Published var saveDetailRestaurant: Bool = false
    
    init(detailUseCase: DetailUseCase) {
        self.detailUseCase = detailUseCase
        restaurant = detailUseCase.getRestaurant()
        detailRestaurant = detailUseCase.getDetailRestaurantFromModel()
    }
    
    func getDetailRestaurant(of id: String) {
        loadingState = true
        detailUseCase.getDetailRestaurant(of: id)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.detailRestaurant = result
            } onError: { error in
                self.errorMessage = error.localizedDescription
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func addDetailRestaurant(of data: [RestaurantEntity]) {
        loadingState = true
        detailUseCase.addDetailRestaurant(of: data)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.saveDetailRestaurant = result
            } onError: { _ in
                self.errorMessage = "Failed to save detail restaurant"
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
    func deleteDetailRestaurant(of data: [RestaurantEntity]) {
        loadingState = true
        detailUseCase.deleteDetailRestaurant(of: data)
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.saveDetailRestaurant = result
            }onError: { _ in
                self.errorMessage = "Failed to save detail restaurant"
            } onCompleted: {
                self.loadingState = false
            }.disposed(by: disposeBag)
    }
    
}
