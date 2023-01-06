//
//  Endpoints.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation

let baseUrl = "https://www.reddit.com/r/chile/"

enum HTTPMethods {
    case get
    case post
    case put
    case delete
    case patch
}

enum Endpoints {
    case getAll
    
    private var fullPath: String{
        var endpoint: String
        
        switch self{
        case .getAll:
            endpoint = "new/.json?limit=100"
        }
        return baseUrl + endpoint
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
            preconditionFailure("The url used in \(Endpoints.self) is not valid")
        }
        return url
    }
}
