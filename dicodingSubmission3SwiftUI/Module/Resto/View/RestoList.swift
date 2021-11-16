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
    
    var body: some View {
        VStack {
            imageFood
            textFood
        }
    }
}

extension RestoList {
    
    var imageFood: some View {
        
        WebImage(url: URL(string: Endpoints.Gets.imageLarge.url + restaurant.pictureId))
            .placeholder(Image(systemName: "photo"))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 160, height: 190)
            .shadow(radius: 5)
            .cornerRadius(12)
        
    }
    
    var textFood: some View {
        
        Text(restaurant.name)
            .bold()
            .multilineTextAlignment(.center)
            .foregroundColor(.red)
        
    }
    
}
