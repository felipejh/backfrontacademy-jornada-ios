//
//  ViewController.swift
//  FirstAppMVVM
//
//  Created by Felipe Hoffmann on 14/04/24.
//

import UIKit

class HomeVC: UIViewController {
    
    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
        viewModel.delegate(delegate: self)
        viewModel.fetchAllRequest()
    }


}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        self.homeScreen?.collectionView.reloadData()
        print(#function)
        DispatchQueue.main.async {
            self.homeScreen?.configProtocolsCollectionView(delegate: self, dataSource: self)
            self.homeScreen?.collectionView.reloadData()
        }
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        self.homeScreen?.collectionView.reloadData()
        
    }
    
    func error() {
        print(#function)
    }
    
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
            cell?.setupCell(listStory: viewModel.getListStories)
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPosts: viewModel.getListPosts)
            
            return cell ?? UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }
}
