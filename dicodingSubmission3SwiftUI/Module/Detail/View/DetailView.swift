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
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    
    var body: some View {
        ZStack {
            
            if presenter.loadingState {
                Loading()
            } else {
                ScrollView{
                    VStack{
                        imageDetail
                        content
                        food
                        drink
                        reviews
                    }
                }
            }
            
        }
        .onAppear {
            if !self.presenter.restaurant.id.isEmpty {
                self.presenter.getDetailRestaurant(of: presenter.restaurant.id)
            }
        }
        .navigationBarTitle("Detail", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                self.mode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrow.left")
                    .foregroundColor(Color.white)
            }),
            trailing: Button(action: {
//                if selected {
//                    favorite.deleteData(of: type != "favorite" ? Int32(game.id) : gameData.id)
//                    selected = false
//                    type == "favorite" ? self.mode.wrappedValue.dismiss() : nil
//                } else {
//                    favorite.addData(data: game)
//                    selected = true
//                }
            }, label: {
//                if selected {
//                    Image(systemName: "heart.fill").foregroundColor(Color("Gray"))
//                } else {
//                    Image(systemName: "heart").foregroundColor(Color("Gray"))
//                }
            })
        )
        .gesture(DragGesture().updating($dragOffset, body: { (value, _, _) in
            if value.startLocation.x < 20 && value.translation.width > 100 {
                self.mode.wrappedValue.dismiss()
            }
        }))
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
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
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
            LazyVGrid(columns: columns) {
                ForEach(presenter.detailRestaurant.categories, id: \.self) { category in
                    CardView(content: category.name ?? "")
                }
            }
            Spacer()
            Text(presenter.detailRestaurant.descriptions)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        
    }
    
    var food: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Food")
                .bold()
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(presenter.detailRestaurant.menus.foods, id: \.self) { food in
                    CardView(content: food.name ?? "")
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    var drink: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Drink")
                .bold()
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(presenter.detailRestaurant.menus.drinks, id: \.self) { drink in
                    CardView(content: drink.name ?? "")
                }
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    var reviews: some View {
        VStack(alignment: .leading, spacing: 5){
            Text("Reviews")
                .bold()
            Spacer()
            ForEach(presenter.detailRestaurant.customerReviews, id: \.self) { review in
                VStack(alignment: .leading, spacing: 5){
                    HStack{
                        Text(review.name ?? "")
                            .foregroundColor(.white)
                            .bold()
                        Spacer()
                        Text(review.date ?? "")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    .padding(10)
                    Text(review.review ?? "")
                        .foregroundColor(.white)
                        .padding(10)
                    Spacer()
                }
                .background(Color.yellow)
                .cornerRadius(8)
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
}

struct CardView: View {
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 8)
            shape.fill().foregroundColor(.yellow)
            Text(content)
                .padding(10)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .lineLimit(3)
        }
    }
}
