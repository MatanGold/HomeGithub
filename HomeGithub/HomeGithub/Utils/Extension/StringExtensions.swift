//
//  StringExtensions.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
