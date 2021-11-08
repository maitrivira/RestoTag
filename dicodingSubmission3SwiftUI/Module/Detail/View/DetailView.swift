//
//  DetailView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 03/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    @ObservedObject var presenter: DetailPresenter
    
    var body: some View {
        ZStack {
            
            if presenter.loadingState {
                Loading()
            } else {
                ScrollView{
                    VStack{
                        imageDetail
                        content
                    }
                }
            }
            
        }.onAppear {
            if !self.presenter.restaurant.id.isEmpty {
                self.presenter.getDetailRestaurant(of: presenter.restaurant.id)
            }
        }.navigationBarTitle("Detail", displayMode: .inline)
    }
    
}

extension DetailView {
    
    
    
    var imageDetail: some View {
        
        VStack(alignment: .center, spacing: 10){
            Text(presenter.detailRestaurant.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            WebImage(url: URL(string: Endpoints.Gets.imageLarge.url + presenter.detailRestaurant.pictureId))
                .placeholder(Image(systemName: "photo"))
                .resizable()
                .frame(height: 250, alignment: .center)
            
        }
    }
    
    var content: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text(presenter.detailRestaurant.address)
                .bold()
            Text(presenter.detailRestaurant.city)
                .bold()
            HStack {
                Text("Rating :")
                    .bold()
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.orange)
                Text(String(presenter.detailRestaurant.rating))
                    .bold()
            }
            Spacer()
            Text(presenter.detailRestaurant.descriptions)
            Spacer()
//            LazyVGrid(columns: columns) {
//                ForEach(presenter.detailRestaurant.categories) { category in
//                    CardView(content: category.name ?? "")
//                }
//            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        
    }
    
}

struct CardView: View {
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 8)
            shape.fill().foregroundColor(Color("Green"))
            Text(content)
                .padding(4)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .lineLimit(3)
        }
    }
}
