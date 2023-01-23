//
//  ImageListViewController.swift
//  PircterestGallery
//
//  Created by JunHwan Kim on 2022/11/15.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class ImageListViewController: UIViewController, StoryboardInstatiable {
    
    @IBOutlet weak var searchBarContainer: UIView!
    @IBOutlet weak var imageCollectionContainer: UIView!
    private var searchController = UISearchController(searchResultsController: nil)
    var viewModel: ImageListViewModel?
    
    private var imageCollectionViewController: ImageListCollectionViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    static func create(viewModel: ImageListViewModel) -> ImageListViewController{
        let view = ImageListViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == String(describing: ImageListCollectionViewController.self),
            let destinationVC = segue.destination as? ImageListCollectionViewController {
            imageCollectionViewController = destinationVC
            imageCollectionViewController?.imageRepository = DefaultImageRepository()
            self.imageCollectionViewController?.viewModel = viewModel
        }
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
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        viewModel?.didSearch(query: searchText)
    }
}

extension ImageListViewController: UISearchControllerDelegate {
    
}
