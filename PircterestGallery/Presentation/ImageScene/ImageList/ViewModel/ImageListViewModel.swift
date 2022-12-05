//
//  ImageListViewModel.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/20.
//

import Foundation
import RxSwift
import Moya

protocol ImageListViewModelInput {
    func showRecommendImage()
    func didSearch(query: String)
}

protocol ImageListViewModelOutput {
}

protocol ImageListViewModel: ImageListViewModelInput, ImageListViewModelOutput {}

class DefaultImageListViewModel: ImageListViewModel {
    let provider = MoyaProvider<NetworkService>()
}

extension DefaultImageListViewModel {
    
    func showRecommendImage()  {
        provider.request(.fetchRecommendImageList) { result in
            switch result {
            case .success(let response):
                do {
                   let abc = try JSONDecoder().decode([ImageDTO].self, from: response.data)
                    print("Images: \(abc)")
                } catch let error{
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func didSearch(query: String) {
        print(query)
        provider.request(.searchImageList(query: ImageQuery(query: query), page: 1)) { result in
            print(result)
        }
    }
}
