//
//  dicodingSubmission3SwiftUIApp.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

@main
struct dicodingSubmission3SwiftUIApp: App {
    
    let restoPresenter = RestoPresenter(restoUseCase: Injection.init().provideResto())
    let favPresenter = FavouritePresenter(favUseCase: Injection.init().provideFav())
    let searchPresenter = SearchPresenter(searchUseCase: Injection.init().provideSearch())
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(restoPresenter)
                .environmentObject(favPresenter)
                .environmentObject(searchPresenter)
        }
    }
}
