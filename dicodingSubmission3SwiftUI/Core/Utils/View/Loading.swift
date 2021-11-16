//
//  Loading.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 07/11/21.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        VStack {      
            ActivityIndicator()
            Text("Loading...")
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
