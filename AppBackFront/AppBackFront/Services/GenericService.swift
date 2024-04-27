//
//  GenericService.swift
//  AppBackFront
//
//  Created by Felipe Hoffmann on 27/04/24.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFail(name: String, Swift.Error)
    case errorRequest(AFError)
}

protocol GenericService: AnyObject {
    typealias completion<T> = (_ result: T, _ failure: Error?) -> Void
}
