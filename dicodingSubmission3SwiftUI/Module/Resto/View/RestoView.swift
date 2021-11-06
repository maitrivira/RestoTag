//
//  RestoView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 02/11/21.
//

import SwiftUI

struct RestoView: View {
    
    @ObservedObject var presenter: RestoPresenter
    
    let text = ["apa", "kenapa", "bagaimana", "siapa", "kapan", "dimana", "apa", "kenapa", "bagaimana", "siapa", "kapan", "dimana"]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        VStack {
            
            if presenter.loadingState {
                ActivityIndicator()
            } else {
                
                ScrollView{
                    LazyVGrid(columns: columns) {
                        ForEach((0..<text.count), id: \.self) { t in
                            Card(content: text[t])
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    .padding(16)
                }
                
            }
            
        }.onAppear {
            if self.presenter.restaurants.count == 0 {
                self.presenter.getRestaurants()
            }
        }.navigationBarTitle("Restos", displayMode: .automatic)
        
    }
    
}

struct Card: View{
    
    var content: String
    
    var body: some View{
        VStack{
            Button(action: {}) {
                
                VStack{
                    
                    imageFood
                    textFood
                    
                }
                
            }
        }
    }
}

extension Card {
    
    var imageFood: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.green)
                .padding(4)
            
                Text("image")
        }
        
    }
    
    var textFood: some View {
        
        Text(content)
            .font(.title3)
            .lineLimit(3)
            .foregroundColor(.black)
        
    }
    
}
