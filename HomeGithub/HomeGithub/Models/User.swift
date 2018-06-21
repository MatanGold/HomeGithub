//
//  User.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}
