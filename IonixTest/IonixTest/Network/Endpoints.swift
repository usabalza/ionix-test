//
//  Endpoints.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation

enum Endpoints {
    case getAll(after: String?)
    case searchText(text: String, after: String?)

    private var fullPath: String {
        var endpoint: String

        switch self {
        case .getAll(let after):
            endpoint = "new/.json?limit=100"
            if let after = after {
                endpoint.append("&after=\(after)")
            }
        case .searchText(let text, let after):
            endpoint = "search.json?q=\(text)&limit=100"
            if let after = after {
                endpoint.append("&after=\(after)")
            }
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
