//
//  DataManager.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

class DataManager {
    
    //MARK: - Singleton & Init
    static let shared = DataManager()
    private init() {
        setup()
    }
    
    private func setup() { }
    
    //MARK: - Properties
    var currentUser: User?
}



