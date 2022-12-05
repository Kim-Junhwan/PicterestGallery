//
//  FetchRecommendImageUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/20.
//

import Foundation

protocol FetchRecommendImageUseCase {
    func excute()
}

final class DefaultFetchRecommendImageUseCase: FetchRecommendImageUseCase {
    
    let imagesRepository: ImagesRepository
    
    init(imagesRepository: ImagesRepository) {
        self.imagesRepository = imagesRepository
    }
    
    func excute() {
        
    }
    
}
