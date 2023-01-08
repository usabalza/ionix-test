//
//  Meme.swift
//  IonixTest
//
//  Created by Uziel Sabalza on 5/1/23.
//

import Foundation

struct Meme: Codable {
    var linkFlairText: String?
    var postHint: String?
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

struct BaseData: Codable {
    var kind: String
    var data: Pagination
}

struct Pagination: Codable {
    var after: String
    var dist: Int
    var modhash: String
    var geoFilter: String
    var children: [BaseMeme]
    var before: String?

    enum CodingKeys: String, CodingKey {
        case after = "after"
        case dist = "dist"
        case modhash = "modhash"
        case geoFilter = "geo_filter"
        case children = "children"
        case before = "before"
    }
}

struct BaseMeme: Codable {
    var kind: String
    var data: Meme
}
