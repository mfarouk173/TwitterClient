//
//  FollowerCollectionCell.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class FollowerCollectionCell: UICollectionViewCell {
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var cellWidth: NSLayoutConstraint!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImage.roundSquareImage()
    }
}
