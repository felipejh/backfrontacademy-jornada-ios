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
                    self.delegate?.success()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
        
    }
}
