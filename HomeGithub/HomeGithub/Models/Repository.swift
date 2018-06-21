//
//  Repository.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

struct Repository: Codable {
    
//    var id: String
    var name: String
    var isPrivate: Bool
    var htmlUrl: URL
//    var updatedAt: Date
    
    enum CodingKeys: String, CodingKey {
//        case id
        case name
        case isPrivate = "private"
        case htmlUrl = "html_url"
//        case updatedAt = "updated_at"
    }
}
