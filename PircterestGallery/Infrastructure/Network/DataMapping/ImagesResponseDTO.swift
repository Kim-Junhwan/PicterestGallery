//
//  ImagesResponseDTO.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/12/05.
//

import Foundation

struct ImagesResponseDTO: Decodable {
    let totalPages: Int
    let results: [ImageDTO]
    
    private enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case results
    }
}

struct ImageDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case imagePath = "urls"
    }
    
    struct ImagePathDTO: Decodable {
        let small: String
    }
    let id: String?
    let width: Int?
    let height: Int?
    let imagePath: ImagePathDTO?
}

extension ImagesResponseDTO {
    func toDomain(page: Int) -> ImagesPage {
        return .init(page: page, totalPage: totalPages, images: results.map({$0.toDomain()}))
    }
}

extension ImageDTO {
    func toDomain() -> PicterestImage {
        return .init(id: id ?? "", width: width ?? 0, height: height ?? 0, imagePath: imagePath?.small ?? "")
    }
}
