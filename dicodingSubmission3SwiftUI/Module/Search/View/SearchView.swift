//
//  SearchView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 15/11/21.
//

import SwiftUI

struct Searchview: View {
    
    @State var isSearching: Bool = false
    @ObservedObject var presenter: SearchPresenter
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(
                  text: $presenter.title,
                  onSearchButtonClicked: presenter.searchResto
                )
                
                ZStack {
                  if presenter.loadingState {
                    loadingIndicator
                  } else if presenter.title.isEmpty {
                    emptyTitle
                  } else if presenter.restaurants.isEmpty {
                    emptyMeals
                  } else if !presenter.errorMessage.isEmpty {
                    errorIndicator
                  } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns) {
                            ForEach(
                              self.presenter.restaurants,
                              id: \.id
                            ) { restaurant in
                                self.presenter.linkBuilder(for: restaurant, detailRestaurant: dummyData) {
                                    RestoList(restaurant: restaurant)
                                        .aspectRatio(2/3, contentMode: .fit)
                                }
                            }
                        }
                    }
                  }
                }
                
            }
            .navigationBarTitle("Search", displayMode: .inline)
        }
    }
}

extension Searchview {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ActivityIndicator()
    }
  }
  
  var errorIndicator: some View {
    CustomEmptyView(
      image: "assetSearchNotFound",
      title: presenter.errorMessage
    ).offset(y: 80)
  }
  
  var emptyTitle: some View {
    CustomEmptyView(
      image: "assetSearchMeal",
      title: "Come on, find your favorite food!"
    ).offset(y: 50)
  }
  var emptyMeals: some View {
    CustomEmptyView(
      image: "assetSearchNotFound",
      title: "Data not found"
    ).offset(y: 80)
  }
  
}
