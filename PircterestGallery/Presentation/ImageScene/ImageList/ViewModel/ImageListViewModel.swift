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
    var fetching: Driver<[ImageListItemViewModel]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
}

protocol ImageListViewModel: ImageListViewModelInput, ImageListViewModelOutput {}

class DefaultImageListViewModel: ImageListViewModel {
    
    private let searchImageUseCase: SearchImageUseCase
    private let fetchRecommendImageUseCase: FetchRecommendImageUseCase
    
    var currentPage: Int = 0
    var totalPageCount: Int = 1
    var hasMorePage: Bool { currentPage < totalPageCount }
    var nextPage: Int { hasMorePage ? currentPage+1 : currentPage }
    var isLoading: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    
    private var movies: BehaviorRelay<[ImageListItemViewModel]> = BehaviorRelay(value: [])
    private var disposeBag = DisposeBag()
    
    var fetching: Driver<[ImageListItemViewModel]> {
        return movies.asDriver()
    }
    
    init(searchImageUseCase: SearchImageUseCase, fetchRecommendImageUseCase: FetchRecommendImageUseCase) {
        self.searchImageUseCase = searchImageUseCase
        self.fetchRecommendImageUseCase = fetchRecommendImageUseCase
    }
    
}

extension DefaultImageListViewModel {
    
    func showRecommendImage()  {
        isLoading.accept(true)
        fetchRecommendImageUseCase.excute().subscribe { imagesPage in
            imagesPage.map { page in
                let result = page.images.map {ImageListItemViewModel(id: $0.id, width: $0.width, height: $0.height, imagePath: $0.imagePath)}
                print(result)
                self.isLoading.accept(false)
                self.appendPage(imageList: result)
            }
        }.disposed(by: disposeBag)
    }
    
    private func resetPage() {
        currentPage = 0
        totalPageCount = 1
        self.movies.accept([])
    }
    
    private func appendPage(imageList: [ImageListItemViewModel]) {
        movies.accept(imageList)
    }
    
    func didSearch(query: String)  {
        isLoading.accept(true)
        searchImageUseCase.excute(query: ImageQuery(query: query), page: nextPage)
            .subscribe { imagesPage in
                imagesPage.map { page in
                    let result = page.images.map {ImageListItemViewModel(id: $0.id, width: $0.width, height: $0.height, imagePath: $0.imagePath)}
                    self.appendPage(imageList: result)
                    self.isLoading.accept(false)
                }
            }.disposed(by: disposeBag)
    }
    
}
