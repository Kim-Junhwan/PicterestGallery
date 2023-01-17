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
    var fetching: Driver<[ImagesPage]> { get }
}

protocol ImageListViewModel: ImageListViewModelInput, ImageListViewModelOutput {}

class DefaultImageListViewModel: ImageListViewModel {
    
    private let searchImageUseCase: SearchImageUseCase
    private let fetchRecommendImageUseCase: FetchRecommendImageUseCase
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePage: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePage ? currentPage+1 : currentPage }
    
    private var movies: BehaviorRelay<[ImagesPage]> = BehaviorRelay(value: [])
    
    var fetching: Driver<[ImagesPage]> {
        return movies.asDriver()
    }
    
    init(searchImageUseCase: SearchImageUseCase, fetchRecommendImageUseCase: FetchRecommendImageUseCase) {
        self.searchImageUseCase = searchImageUseCase
        self.fetchRecommendImageUseCase = fetchRecommendImageUseCase
    }
    
}

extension DefaultImageListViewModel {
    
    func showRecommendImage()  {
        fetchRecommendImageUseCase.excute().subscribe { imagesPage in
            self.movies.accept([imagesPage])
        }
    }
    
    private func resetPage() {
        currentPage = 0
        totalPageCount = 1
        self.movies.accept([])
        
    }
    
    private func appendPage() {
        
    }
    
    func didSearch(query: String)  {
        searchImageUseCase.excute(query: ImageQuery(query: query), page: nextPage)
            .subscribe { imagesPage in
                self.movies.accept([imagesPage])
            }
    }
    
}
