//
//  FetchRecommendImageUseCase.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/16.
//

import Foundation
import RxSwift
import Moya

protocol FetchRecommendImageUseCase {
    func excute() -> Observable<ImagesPage>
}

final class DefaultFetchRecommendImageUseCase: FetchRecommendImageUseCase {
    
    private let provider: MoyaProvider<NetworkService>
    
    init(provider: MoyaProvider<NetworkService>) {
        self.provider = provider
    }
    
    func excute() -> Observable<ImagesPage> {
        return provider.rx.request(.fetchRecommendImageList)
            .asObservable()
            .map { try JSONDecoder().decode([ImageDTO].self, from: $0.data)}
            .map { images in
                return ImagesResponseDTO(totalPages: 1, results: images).toDomain(page: 1)
            }
            
    }
    
    
}
