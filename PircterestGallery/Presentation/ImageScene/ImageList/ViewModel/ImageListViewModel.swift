//
//  ImageListViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/20.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

protocol ImageListViewModelInput {
    func showRecommendImage()
    func didSearch(query: String)
}

protocol ImageListViewModelOutput {
    var fetching: Driver<[PicterestImage]> { get }
}

protocol ImageListViewModel: ImageListViewModelInput, ImageListViewModelOutput {}

class DefaultImageListViewModel: ImageListViewModel {
    var fetching: Driver<[PicterestImage]> {
        return movies.asDriver()
    }
    
    private var movies: BehaviorRelay<[PicterestImage]> = BehaviorRelay(value: [])
    let provider = MoyaProvider<NetworkService>()
    
}

extension DefaultImageListViewModel {
    
    func showRecommendImage()  {
        provider.request(.fetchRecommendImageList) { result in
            switch result {
            case .success(let response) :
                do {
                    let data = try JSONDecoder().decode(ImagesResponseDTO.self, from: response.data)
                    print("fetch response: \(data)")
                } catch {
                    print("decoding error \(error.localizedDescription)")
                }
            case .failure(let error) :
                print("Fetch recommend List Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func resetPage() {
        
    }
    
    func didSearch(query: String)  {
        provider.request(.searchImageList(query: ImageQuery(query: query), page: 1)) { result in
            switch result {
            case .success(let response) :
                print(response)
            case .failure(let error) :
                print("Search Error: \(error.localizedDescription)")
            }
        }
    }
    
}
