//
//  TweetTableCell.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/26/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit

class TweetTableCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.roundSquareImage()
    }
}
