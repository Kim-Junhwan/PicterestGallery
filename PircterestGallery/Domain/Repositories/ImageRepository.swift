//
//  ImagesRepository.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/10/30.
//

import Foundation
import RxSwift

protocol ImageRepository {
    func fetchImage(url: String) -> Observable<UIImage>
}
