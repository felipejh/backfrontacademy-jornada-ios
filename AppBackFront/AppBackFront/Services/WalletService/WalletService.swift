//
//  WalletService.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 03/05/24.
//

import UIKit
import Alamofire

protocol WalletServiceDelegate: GenericService {
    func getWalletFromJson(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceDelegate {

    func getWallet(completion: @escaping completion<WalletData?>) {
        let url: String = "https://run.mocky.io/v3/9be98d1c-355b-4557-a252-2ade97da6bfe"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("ERROR -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let walletData: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(walletData, nil)
            } catch {
                completion(nil, Error.fileDecodingFail(name: "WalletData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "WalletData"))
        }
    }
}
