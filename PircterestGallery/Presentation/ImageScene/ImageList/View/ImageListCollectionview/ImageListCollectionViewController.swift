//
//  ImageListCollectionViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/16.
//

import UIKit

private let reuseIdentifier = "Cell"

class ImageListCollectionViewController: UICollectionViewController {
    
    var viewModel: ImageListViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = nil
        collectionView.delegate = nil
        collectionView.register(ImageListCollectionViewCell.self, forCellWithReuseIdentifier: ImageListCollectionViewCell.reuseIdentifier)
        viewModel?.fetching.drive(collectionView.rx.items(cellIdentifier: ImageListCollectionViewCell.reuseIdentifier, cellType: ImageListCollectionViewCell.self)) {  index, result, cell in
            
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: result.imagePath)!)) { data, response, error in
                if error != nil {
                    print(error?.localizedDescription)
                } else {
                    print(data)
                    DispatchQueue.main.async {
                        cell.picterestImageView.image = UIImage(data: data!)
                    }
                }
            }.resume()
            
        }
    }
    
    func reload() {
        collectionView.reloadData()
    }
}
 
extension ImageListCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
