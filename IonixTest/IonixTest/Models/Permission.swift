//
//  Permission.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//

import Foundation

struct Permission: Codable {
    var name: String
    var description: String
    var image: String
    var allowTitle: String
    var denyTitle: String
}
