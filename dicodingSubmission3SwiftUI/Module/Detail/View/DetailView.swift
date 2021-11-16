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
    @ObservedObject var detailPresenter: DetailPresenter
    @ObservedObject var favPresenter: FavouritePresenter
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @GestureState private var dragOffset = CGSize.zero
    @State var selected: Bool = false
    
    var body: some View {
        ZStack {
            
            if detailPresenter.loadingState {
                Loading()
            } else if detailPresenter.detailRestaurant.id == "0" {
                Loading()
            } else {
                ScrollView {
                    VStack {
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.detailPresenter.getDetailRestaurant(of: detailPresenter.restaurant.id)
                checkIcon()
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
                
                if selected {
                    selected = false
                    self.detailPresenter.deleteDetailRestaurant(of: RestaurantsMapper.mapRestaurantModelToEntities(input: detailPresenter.restaurant))
                    self.mode.wrappedValue.dismiss()
                } else {
                    selected = true
                    self.detailPresenter.addDetailRestaurant(of: RestaurantsMapper.mapRestaurantModelToEntities(input: detailPresenter.restaurant))
                }
                
            }, label: {
                
                if selected {
                    Image(systemName: "heart.fill").foregroundColor(Color.white)
                } else {
                    Image(systemName: "heart").foregroundColor(Color.white)
                }
                
            })
        )
        .gesture(DragGesture().updating($dragOffset, body: { (value, _, _) in
            if value.startLocation.x < 20 && value.translation.width > 100 {
                self.mode.wrappedValue.dismiss()
            }
        }))
    }
    
    func checkIcon() {
        favPresenter.getFavourite()
        if favPresenter.containsId(of: detailPresenter.restaurant.id) {
            selected = true
        } else {
            selected = false
        }
    }
    
}

extension DetailView {
    
    var imageDetail: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Text(detailPresenter.detailRestaurant.name)
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)
            
            WebImage(url: URL(string: Endpoints.Gets.imageLarge.url + detailPresenter.detailRestaurant.pictureId))
                .placeholder(Image(systemName: "photo"))
                .resizable()
                .frame(height: 250, alignment: .center)
            
        }
        .padding(EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
    }
    
    var content: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Text(detailPresenter.detailRestaurant.address)
                .bold()
            Text(detailPresenter.detailRestaurant.city)
                .bold()
            HStack {
                Text("Rating :")
                    .bold()
                Image(systemName: "star.fill")
                    .font(.system(size: 10))
                    .foregroundColor(Color.orange)
                Text(String(detailPresenter.detailRestaurant.rating))
                    .bold()
            }
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(detailPresenter.detailRestaurant.categories, id: \.self) { category in
                    CardView(content: category.name ?? "")
                }
            }
            Spacer()
            Text(detailPresenter.detailRestaurant.descriptions)
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        
    }
    
    var food: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Food")
                .bold()
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(detailPresenter.detailRestaurant.menus.foods, id: \.self) { food in
                    CardView(content: food.name ?? "")
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    var drink: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Drink")
                .bold()
            Spacer()
            LazyVGrid(columns: columns) {
                ForEach(detailPresenter.detailRestaurant.menus.drinks, id: \.self) { drink in
                    CardView(content: drink.name ?? "")
                }
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
    
    var reviews: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Reviews")
                .bold()
            Spacer()
            ForEach(detailPresenter.detailRestaurant.customerReviews, id: \.self) { review in
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
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
                .background(Color.red)
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
            shape.fill().foregroundColor(.red)
            Text(content)
                .padding(10)
                .font(.footnote)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .lineLimit(3)
        }
    }
}
