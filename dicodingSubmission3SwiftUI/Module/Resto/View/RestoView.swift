//
//  RestoView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct RestoView: View {
    
    @ObservedObject var presenter: RestoPresenter
    
    var body: some View {
        
        ZStack {
            
            if presenter.loadingState {
                ActivityIndicator()
            }else {
                Text("berhasil fetch data")
            }
            
        }.onAppear {
            if self.presenter.restaurants.count == 0 {
                self.presenter.getRestaurants()
                print("presenter", presenter.loadingState)
            }
        }.navigationBarTitle(
            Text("Resto")
        )
        
    }
}
