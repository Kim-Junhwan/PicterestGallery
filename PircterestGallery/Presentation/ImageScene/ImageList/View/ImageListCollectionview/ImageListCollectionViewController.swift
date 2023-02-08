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
    
    var imageList: [ImageListItemViewModel] = []
    
    private var disposeBag = DisposeBag()
    
    var imageRepository: ImageRepository?

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = MosaicLayout()
        collectionView.dataSource = nil
        collectionView.register(ImageListCollectionViewCell.self, forCellWithReuseIdentifier: ImageListCollectionViewCell.reuseIdentifier)
        viewModel?.showRecommendImage()
        collectionView.collectionViewLayout = layout
        layout.delegate = self
        bind()
    }
    
    func bind() {
        viewModel?.fetching.drive(collectionView.rx.items(cellIdentifier: ImageListCollectionViewCell.reuseIdentifier, cellType: ImageListCollectionViewCell.self)) {  index, result, cell in
            if let cellImage = CacheManager.shared.getCacheImage(id: result.id) {
                cell.picterestImageView.image = cellImage
            } else {
                self.imageRepository?.fetchImage(url: result.imagePath).asDriver(onErrorJustReturn: UIImage(systemName: "circle")!).drive(onNext: { fetchImage in
                    cell.picterestImageView.image = fetchImage
                    CacheManager.shared.saveCacheImage(id: result.id, fetchImage)
                }).disposed(by: self.disposeBag)
            }
        }.disposed(by: disposeBag)
        viewModel?.fetching.drive(onNext: { list in
            self.imageList = list
        }).disposed(by: disposeBag)
    }
    
    func reload() {
        collectionView.reloadData()
    }
}

extension ImageListCollectionViewController: MosaicLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath, contentWidth: CGFloat) -> CGFloat {
        let imageHeight = CGFloat(imageList[indexPath.item].height)
        let imageWidth = CGFloat(imageList[indexPath.item].width)
        let convertHeight = (imageHeight * contentWidth) / imageWidth
        return convertHeight
    }
    
    func collectionView(_ collectionView: UICollectionView, heightForImageAtIndexPath indexPath: IndexPath) -> CGFloat {
        return CGFloat(imageList[indexPath.item].height)
    }
    
}
