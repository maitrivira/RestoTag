//
//  dicodingSubmission3SwiftUIApp.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

@main
struct DicodingSubmission3SwiftUIApp: App {
    
    let restoPresenter = RestoPresenter(restoUseCase: Injection.init().provideResto())
    let favPresenter = FavouritePresenter(favUseCase: Injection.init().provideFav())
    let searchPresenter = SearchPresenter(searchUseCase: Injection.init().provideSearch())
    let profilePresenter = ProfilePresenter(profileUseCase: Injection.init().provideProfile())
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(restoPresenter)
                .environmentObject(favPresenter)
                .environmentObject(searchPresenter)
                .environmentObject(profilePresenter)
        }
    }
}
