//
//  RepoListViewController.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - Outlets
    @IBOutlet weak var tblRepos: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblActivityDescripition: UILabel!
    
    //MARK: - Properties
    private var arrRepo = [Repository]() {
        didSet {
            DispatchQueue.main.async {
                self.tblRepos.reloadData()
            }
        }
    }
    
    
    //MARK: - Life-cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getRepos()
    }

    
    //MARK: - Private Methods
    private func setupUI() {
        guard let name = DataManager.shared.currentUser?.name else { return }
        title = "\(name)'s repos"
        
        tblRepos.tableFooterView = UIView(frame: .zero)
    }
    
    private func getRepos() {
        updateUI(inProcess: true, message: "Please wait while we're getting your repositories")
        
        APIManager.shared.getRepositories(success: { (repos) in
            self.arrRepo = repos
            
            let hasResults = self.arrRepo.count > 0
            let msg = hasResults ? "" : "You have no repositories"
            self.updateUI(inProcess: false, message: msg)
        }, failure: { error in
            self.updateUI(inProcess: false, message: "Couldn't get your repositories")
        })
    }
    
    private func updateUI(inProcess: Bool, message: String) {
        DispatchQueue.main.async {
            inProcess ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            self.lblActivityDescripition.text = message.localized
        }
    }
    
    
    // MARK: - UITableView DataSource & Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRepo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: IDENTIFIER_REPOSITORY_CELL, for: indexPath) as? RepositoryCell else {
            return UITableViewCell()
        }
        
        cell.setupCellWithRepo(arrRepo[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 112
    }
}
