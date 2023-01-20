//
//  ImageListCollectionViewCell.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/13.
//

import UIKit

class ImageListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ImageListCollectionReusableCell"
    
    lazy var picterestImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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
        self.contentView.backgroundColor = .green
        NSLayoutConstraint.activate([
            picterestImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            picterestImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picterestImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            picterestImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
        ])
        
    }
    
}
