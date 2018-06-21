//
//  RepositoryCell.swift
//  HomeGithub
//
//  Created by Matan Gold on 21/06/2018.
//  Copyright © 2018 Matan Gold. All rights reserved.
//

import UIKit

let IDENTIFIER_REPOSITORY_CELL = "RepositoryCell"

class RepositoryCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgIsPrivate: UIImageView!
    @IBOutlet weak var lblHtmlUrl: UILabel!
    @IBOutlet weak var lblLastUpdated: UILabel!
    
    
    //MARK: - Life-cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: - Public Methods
    public func setupCellWithRepo(_ repo: Repository) {
        lblName.text = repo.name
        imgIsPrivate.image = repo.isPrivate ? #imageLiteral(resourceName: "Icon-Private") : #imageLiteral(resourceName: "Icon-Public")
        lblHtmlUrl.text = repo.htmlUrl.absoluteString
        lblLastUpdated.text = "Last update: " + DataManager.shared.dateFormatter.string(from: repo.updatedAt)
    }
}
