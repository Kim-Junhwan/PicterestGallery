//
//  SearchImageUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/14.
//
import Moya
import RxSwift

protocol SearchImageUseCase {
    func excute(query: ImageQuery, page: Int) -> Observable<ImagesPage>
}

import Foundation

final class DefaultSearchImageUseCase: SearchImageUseCase {
    
    private let provider: MoyaProvider<NetworkService>
    
    init(provider: MoyaProvider<NetworkService>) {
        self.provider = provider
    }
    
    func excute(query: ImageQuery, page: Int) -> Observable<ImagesPage> {
        return provider.rx.request(.searchImageList(query: query, page: page))
            .asObservable()
            .map { try JSONDecoder().decode(ImagesResponseDTO.self, from: $0.data)}
            .map { imageDTO in
                imageDTO.toDomain(page: page)
            }

    }
    
}
