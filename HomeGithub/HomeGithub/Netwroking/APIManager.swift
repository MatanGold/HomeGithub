//
//  APIManager.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import Foundation

class APIManager {
    
    //MARK: - Singleton & Init
    static let shared = APIManager()
    private init() {
        setup()
    }
    
    private func setup() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    private var decoder = JSONDecoder()
    
    //MARK: - User server calls
    /////////////////////////////////////////
    ///////////////// USER //////////////////
    /////////////////////////////////////////
    func getUser(loginName: String, success: @escaping() -> Void, failure: @escaping(Error?) -> Void) {
        guard let url = URL(string: GITHUB_BASE_URL + GITHUB_USERS_URL + loginName) else {
            failure(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            guard let data = data else {
                failure(nil)
                return
            }
            do {
                let user = try self.decoder.decode(User.self, from: data)
                DataManager.shared.currentUser = user
                success()
            } catch let error {
                print("\(error)")
                failure(error)
            }
        }.resume()
    }
    
    func getRepositories(success: @escaping([Repository]) -> Void, failure: @escaping(Error?) -> Void) {
        guard let name = DataManager.shared.currentUser?.name else {
            failure(nil)
            return
        }
        
        guard let url = URL(string: GITHUB_BASE_URL + GITHUB_USERS_URL + "\(name)/" + GITHUB_REPOS_URL) else {
            failure(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            guard let data = data else {
                failure(nil)
                return
            }
            do {
                let repositories = try self.decoder.decode([Repository].self, from: data)
                success(repositories)
            } catch let error {
                print("\(error)")
                failure(error)
            }
        }.resume()
    }
}
