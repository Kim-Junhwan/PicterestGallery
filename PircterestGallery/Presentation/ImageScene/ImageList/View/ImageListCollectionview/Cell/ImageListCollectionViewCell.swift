//
//  ImageListCollectionViewCell.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/13.
//

import UIKit
import RxSwift

class ImageListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ImageListCollectionReusableCell"
    private var viewModel: ImageListItemViewModel?
    private var imageRepository: ImageRepository?
    
    lazy var picterestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        self.contentView.addSubview(picterestImageView)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 10
        layer.masksToBounds = false
        NSLayoutConstraint.activate([
            picterestImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            picterestImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picterestImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            picterestImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
}
