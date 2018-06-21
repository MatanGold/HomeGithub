//
//  HelloViewController.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import UIKit

class HelloViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var activityIndicatorLogin: UIActivityIndicatorView!
    @IBOutlet weak var lblActivityDescripition: UILabel!
    
    
    //MARK: - Life-cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginToGithub()
    }
    
    
    //MARK: - Private Methods
    private func loginToGithub() {

        updateUI(inProcess: true, message: "Please wait while we're getting your user")
        
        APIManager.shared.getUser(loginName: "ofirBlox", success: {
            self.updateUI(inProcess: false, message: "Done!")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.performSegue(withIdentifier: "toList", sender: nil)
            })
        }, failure: { error in
            self.updateUI(inProcess: false, message: "Couldn't get your user")
        })
    }
    
    private func updateUI(inProcess: Bool, message: String) {
        DispatchQueue.main.async {
            inProcess ? self.activityIndicatorLogin.startAnimating() : self.activityIndicatorLogin.stopAnimating()
            self.lblActivityDescripition.text = message.localized
        }
    }
}
