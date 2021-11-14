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
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(restoPresenter)
        }
    }
}
