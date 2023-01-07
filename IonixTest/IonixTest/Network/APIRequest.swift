//
//  APIRequest.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation
import Alamofire

class APIRequest: APIProtocol {
    
    private let encoding = JSONEncoding.default
    private let successStatusCodes = 200..<300
    
    func getAllMemes(after: String?, completion: @escaping (APIResponse<BaseData>) -> Void) {
        AF.request(Endpoints.getAll(after: after).url, method: .get, encoding: encoding)
            .validate(statusCode: successStatusCodes)
            .responseDecodable(of: BaseData.self, decoder: JSONDecoder()) { [weak self] response in
                guard let self = self else { return }
                self.printResponse(response: response)
                debugPrint(response)
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(ResponseError.init(msg: error.localizedDescription)))
                }
            }
    }
    
    func searchText(text: String, after: String?, completion: @escaping (APIResponse<BaseData>) -> Void) {
        AF.request(Endpoints.searchText(text: text, after: after).url, method: .get, encoding: encoding)
            .validate(statusCode: successStatusCodes)
            .responseDecodable(of: BaseData.self, decoder: JSONDecoder()) { [weak self] response in
                guard let self = self else { return }
                self.printResponse(response: response)
                debugPrint(response)
                switch response.result {
                case .success(let model):
                    completion(.success(model))
                case .failure(let error):
                    completion(.failure(ResponseError.init(msg: error.localizedDescription)))
                }
            }
    }
    
    func printResponse(response: AFDataResponse<BaseData>) {
        print("\n----------------------API RESPONSE----------------------\n")
        print("\nRequest URL: \n\n" + String(describing: response.request?.url?.absoluteString))
        
//        if let data = response.request?.httpBody {
//            print("\nRequest Body: \n\n" + String(data: data, encoding: String.Encoding.utf8)!)
//        }
        
        if let data = response.data {
            print("\nResponse Body: \n\n" + String(data: data, encoding: String.Encoding.utf8)!)
        }
        
        print("\nResponse Code: \n\n" + String(describing: response.response?.statusCode))
        
    }
}
