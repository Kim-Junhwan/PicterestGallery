//
//  ImageListCollectionViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/16.
//

import UIKit
import RxSwift

class ImageListCollectionViewController: UICollectionViewController {
    
    var viewModel: ImageListViewModel?
    
    private var disposeBag = DisposeBag()
    
    var imageRepository: ImageRepository?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = nil
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = .zero
        collectionView.register(ImageListCollectionViewCell.self, forCellWithReuseIdentifier: ImageListCollectionViewCell.reuseIdentifier)
        viewModel?.showRecommendImage()
        bind()
    }
    
    func bind() {
        viewModel?.fetching.drive(collectionView.rx.items(cellIdentifier: ImageListCollectionViewCell.reuseIdentifier, cellType: ImageListCollectionViewCell.self)) {  index, result, cell in
            self.imageRepository?.fetchImage(url: result.imagePath).asDriver(onErrorJustReturn: UIImage(systemName: "circle")!).drive(cell.picterestImageView.rx.image)
                .disposed(by: self.disposeBag)
        }.disposed(by: disposeBag)
    }
    
    func reload() {
        collectionView.reloadData()
    }
}
 
extension ImageListCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
