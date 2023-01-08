//
//  NetworkEnvironment.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 8/1/23.
//

import Foundation
import Alamofire

// MARK: - Network Environment Variables
let baseUrl = "https://www.reddit.com/r/chile/"
let successStatusCodes = 200..<300
let encoding = JSONEncoding.default

// MARK: - HTTP Methods
enum HTTPMethods {
    case get
    case post
    case put
    case delete
    case patch
}

// MARK: - APIResponse enum
enum APIResponse<T:Codable> {
    case success(_ model: T)
    case failure(_ error: ResponseError)
}

// MARK: - Error response model
class ResponseError: Codable {
    var error: String
    init(msg:String) {
        error = msg
    }
}
