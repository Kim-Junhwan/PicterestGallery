//
//  ImageListItemViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/14.
//

import Foundation

struct ImageListItemViewModel {
    let id: String
    let width: Int
    let height: Int
    let imagePath: String
}

extension ImageListItemViewModel {
    init(picterestImage: PicterestImage) {
        self.id = picterestImage.id
        self.width = picterestImage.width
        self.height = picterestImage.height
        self.imagePath = picterestImage.imagePath
    }
}
