//
//  HomeService.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 27/04/24.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {

    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/07745758-5fa4-4d6d-850f-f02d616efc44"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in
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
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            } catch {
                completion(nil, Error.fileDecodingFail(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
}
