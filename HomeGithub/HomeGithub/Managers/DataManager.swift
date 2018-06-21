//
//  DataManager.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

class DataManager {
    
    //MARK: - Properties
    var currentUser: User?
    let dateFormatter = DateFormatter()

    
    //MARK: - Singleton & Init
    static let shared = DataManager()
    private init() {
        setup()
    }
    
    private func setup() {
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        dateFormatter.locale = Locale.current
    }
}



