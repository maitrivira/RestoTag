//
//  ContentView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restoPresenter: RestoPresenter
    
    var body: some View {
        NavigationView {
            TabView {
                RestoView(presenter: restoPresenter)
                    .tabItem {
                        Label("Resto", systemImage: "house")
                    }
                FavouriteView()
                    .tabItem {
                        Label("Favourite", systemImage: "heart.fill")
                    }
                Searchview()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
