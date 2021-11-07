//
//  ListRow.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 04/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RestoList: View{
    
    var restaurant: RestaurantModel
    let url = "https://restaurant-api.dicoding.dev/images/small/"
    
    var body: some View{
        VStack{
            Button(action: {}) {
                
                VStack(spacing: 15){
                    
                    imageFood
                    textFood
                    
                }
                
            }
        }
    }
}

extension RestoList {
    
    var imageFood: some View {
        
        WebImage(url: URL(string: url + restaurant.pictureId))
            .placeholder(Image(systemName: "photo"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 160, height: 190)
            .shadow(radius: 5)
            .cornerRadius(12)
        
    }
    
    var textFood: some View {
        
        Text(restaurant.name)
            .font(.title3)
            .lineLimit(1)
            .foregroundColor(.black)
        
    }
    
}
