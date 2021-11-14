//
//  ContentView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var restoPresenter: RestoPresenter
    @EnvironmentObject var favPresenter: FavouritePresenter
    let coloredNavAppearance = UINavigationBarAppearance()
    init() {
        UITabBar.appearance().barTintColor = .red
        coloredNavAppearance.configureWithOpaqueBackground()
        coloredNavAppearance.backgroundColor = .red
        coloredNavAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredNavAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().standardAppearance = coloredNavAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredNavAppearance
    }
    
    var body: some View {
        TabView {
            RestoView(presenter: restoPresenter)
                .tabItem {
                    Label("Resto", systemImage: "house")
                }
            FavouriteView(presenter: favPresenter)
                .tabItem {
                    Label("Favourite", systemImage: "heart.fill")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
