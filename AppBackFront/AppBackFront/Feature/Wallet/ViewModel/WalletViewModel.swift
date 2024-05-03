//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 03/05/24.
//

import UIKit

class WalletViewModel {
    
    private let service: WalletService = WalletService()

    public func fetch(_ type: TypeFetch) {
        switch type {
        case .mock:
            service.getWalletFromJson { result, failure in
                print(result)
            }
        case .request:
            service.getWallet { result, failure in
                print("succes")
            }
        }
    }
}
