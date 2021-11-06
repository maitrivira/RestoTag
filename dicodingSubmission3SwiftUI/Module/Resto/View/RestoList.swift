//
//  ListRow.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 04/11/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct RestoList: View {
    
    var restaurant: RestaurantModel
    let url = "https://restaurant-api.dicoding.dev/images/medium/"
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        
        VStack(spacing: 15){
            
            WebImage(url: URL(string: url + restaurant.pictureId))
                .placeholder(Image(systemName: "photo"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 100)
                .shadow(radius: 5)
                .cornerRadius(12)
            
            Spacer()
            
            Text(restaurant.name)
            
        }
        
    }
}
