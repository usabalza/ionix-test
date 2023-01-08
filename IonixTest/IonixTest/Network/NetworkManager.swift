//
//  NetworkManager.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation
import Alamofire

enum APIResponse<T:Codable> {
    case success(_ model: T)
    case failure(_ error: ResponseError)
}

class ResponseError: Codable {
    var error: String
    init(msg:String) {
        error = msg
    }
}

class NetworkManager {
    private let successStatusCodes = 200..<300
    private let timeoutInterval = 30.0
    private let decoder = JSONDecoder()
    private let encoding = JSONEncoding.default
}
