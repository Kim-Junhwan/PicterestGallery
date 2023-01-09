//
//  ImagesResponseDTO.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/12/05.
//

import Foundation

struct ImagesResponseDTO: Decodable {
    let results: [ImageDTO]
}

struct ImageDTO: Decodable {
//    private enum CodingKeys: String, CodingKey {
//        case id
//        case width
//        case height
//        case imagePath = "urls"
//    }
    
    struct ImagePathDTO: Decodable {
        let small: String
    }
    let id: String?
    let width: Int?
    let height: Int?
    let urls: ImagePathDTO
}
