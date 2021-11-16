//
//  ProfileInteractor.swift
//  dicodingSubmission3SwiftUI
//
//  Created by Maitri Vira on 13/11/21.
//

import Foundation

protocol ProfileUseCase {
    
}

class ProfileInteractor: ProfileUseCase {
    
    private let repository: RestoRepositoryProtocol
    
    required init(repository: RestoRepositoryProtocol) {
        self.repository = repository
    }
    
}
