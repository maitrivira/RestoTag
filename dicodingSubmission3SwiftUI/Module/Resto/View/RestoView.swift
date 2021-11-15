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
        NavigationView {
            VStack {
                
                if presenter.loadingState {
                    Loading()
                } else {
                    
                    ScrollView{
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
            .navigationBarTitle("Resto", displayMode: .inline)
        }
        .onAppear {
            self.presenter.getRestaurants()
        }
        
    }
    
}
