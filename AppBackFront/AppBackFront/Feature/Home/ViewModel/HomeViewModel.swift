//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 27/04/24.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    private let service = HomeService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    private weak var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
    // MARK: Filter CollectionView
    public var numberOfItemsInSection: Int {
        return searchNftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItem: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    // MARK: NFT TableViewCell
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRow: CGFloat {
        return 360
    }
    
    // MARK: Filter
    public func filterSearchText(_ text: String) {
        if text.isEmpty {
            searchNftData?.nftList = nftData?.nftList
        } else {
            searchNftData?.nftList = nftData?.nftList?.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
}
