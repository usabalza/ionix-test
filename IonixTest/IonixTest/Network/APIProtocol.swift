//
//  APIProtocol.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 6/1/23.
//

import Foundation

protocol APIProtocol {
    func getAllMemes(completion: @escaping(APIResponse<BaseData>) -> Void)
}
