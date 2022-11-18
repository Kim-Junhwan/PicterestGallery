//
//  ImageListViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/15.
//

import Foundation
import UIKit

final class ImageListViewController: UIViewController, StoryboardInstatiable {
    
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var imageCollectionContainer: UIView!
    private var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    static func create() -> ImageListViewController{
        let view = ImageListViewController.instantiateViewController()
        return view
    }
    
    private func setupViews() {
        setupSearchController()
    }
}

extension ImageListViewController {
    private func setupSearchController() {
        searchController.delegate = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = true
        searchController.searchBar.barStyle = .black
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.frame = searchBarContainer.bounds
        searchController.searchBar.autoresizingMask = [.flexibleWidth]
        searchBarContainer.addSubview(searchController.searchBar)
        definesPresentationContext = true
    }
}

extension ImageListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension ImageListViewController: UISearchControllerDelegate {
    
}
