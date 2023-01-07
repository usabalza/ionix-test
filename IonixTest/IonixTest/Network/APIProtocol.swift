//
//  APIProtocol.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation

protocol APIProtocol {
    func getAllMemes(after: String?, completion: @escaping(APIResponse<BaseData>) -> Void)
    func searchText(text: String, after: String?, completion: @escaping(APIResponse<BaseData>) -> Void)
}
