//
//  Meme.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//

import Foundation

struct Meme: Codable {
    var linkFlairText: String
    var postHint: String
    var title: String
    var url: String
    var score: Int
    var numComments: Int
    
    enum CodingKeys: String, CodingKey {
        case linkFlairText = "link_flair_text"
        case postHint = "post_hint"
        case title = "title"
        case url = "url"
        case score = "score"
        case numComments = "num_comments"
    }
}
