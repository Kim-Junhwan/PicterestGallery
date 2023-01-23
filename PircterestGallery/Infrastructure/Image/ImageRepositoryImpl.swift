//
//  ImageRepositoryImpl.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/24.
//

import Foundation
import RxSwift

final class DefaultImageRepository: ImageRepository {
    func fetchImage(url: String) -> Observable<UIImage> {
        return Observable.just(url)
            .map {URL(string: $0)}
            .map {URLRequest(url: $0!)}
            .flatMap {URLSession.shared.rx.data(request: $0)}
            .map { return UIImage(data: $0)!}
    }
    
}
