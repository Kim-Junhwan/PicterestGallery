//
//  CustomCollectionViewFlowLayout.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2023/01/29.
//

import UIKit

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else { return }
        
        self.itemSize = CGSize(width: cv.bounds.inset(by: cv.layoutMargins).size.width, height: 300)
        
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }

}
