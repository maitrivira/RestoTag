//
//  RestoView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct RestoView: View {
    
    @ObservedObject var presenter: RestoPresenter
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        VStack {
            
            if presenter.loadingState {
                ActivityIndicator()
            } else {
                
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach((self.presenter.restaurants), id: \.self) { restaurant in
                            self.presenter.linkBuilder(for: restaurant) {
                                RestoList(restaurant: restaurant)
                                    .aspectRatio(2/3, contentMode: .fit)
                            }
                        }
                    }
                    .padding(16)
                }
                
            }
            
        }.onAppear {
            if self.presenter.restaurants.count == 0 {
                self.presenter.getRestaurants()
            }
        }.navigationBarTitle("Resto", displayMode: .automatic)
        
    }
    
}
