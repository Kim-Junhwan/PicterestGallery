//
//  PicterestImage.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/30.
//

import Foundation

struct PicterestImage: Identifiable {
    let id: String
    let width: Int
    let height: Int
    let imagePath: String
}

struct ImagesPage {
    let page: Int
    let totalPage: Int
    let images: [PicterestImage]
}
