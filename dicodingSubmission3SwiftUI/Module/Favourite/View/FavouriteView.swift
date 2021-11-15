//
//  FavouriteView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct FavouriteView: View {
    @ObservedObject var presenter: FavouritePresenter
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                if presenter.loadingState {
                    Loading()
                } else {
                    
                    if presenter.restaurants.isEmpty {
                        
                        VStack {
                            Text("Data is Empty")
                        }
                        
                    } else {
                        
                        ScrollView {
                            LazyVGrid(columns: columns) {
                                ForEach((self.presenter.restaurants), id: \.self) { restaurant in
                                    self.presenter.linkBuilder(for: restaurant, detailRestaurant: dummyData) {
                                        RestoList(restaurant: restaurant)
                                            .aspectRatio(2/3, contentMode: .fit)
                                    }
                                }
                            }
                            .padding(16)
                        }
                        
                    }
                    
                }
                
            }
            .navigationBarTitle("Favourite", displayMode: .inline)
        }
        .onAppear {
            self.presenter.getFavourite()
        }
        
    }
}
