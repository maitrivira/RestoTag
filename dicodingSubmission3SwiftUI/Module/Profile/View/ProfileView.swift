//
//  ProfileView.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 08/11/21.
//

import SwiftUI

struct ProfileView: View {
    @State private var name: String = "Maitri Vira"
    @State private var job: String = "Learner at Apple Developer Academy"
    @State private var desc: String = "Hi, I'm Maitri Vira a Learner at Apple Developer Academy Batam. Currently focusing on mobile and web development."
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ZStack {
                        Image("maitri")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150.0, height: 150.0)
                            .clipShape(Circle())
                            .padding(.top)
                            .shadow(radius: 5)
                    }
                    Text(name)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    Text(job)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                    Text(desc)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
