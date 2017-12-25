//
//  FollowerListViewController.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import Kingfisher
import EZSwiftExtensions

final class FollowerListViewController: UIViewController, Instantiatable {
    static var viewControllerId: ViewContollerId {
        return .followerListViewController
    }
    
    var viewModel: FollowerViewModel!

    @IBOutlet weak var collectionView: UICollectionView!
    var users: [User]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.rx.items()
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.getFollowers(completion: {[weak self] users in
            self?.users = users
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
}

extension FollowerListViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let users = users {
            return users.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FollowerCollectionCell
        if let user = users?[indexPath.row] {
            cell.bioLabel.text = user.bio
            cell.handleLabel.text = "@\(user.handle)"
            cell.nameLabel.text = user.name
            cell.profileImage.roundSquareImage()
            cell.profileImage.kf.indicatorType = .activity
            cell.profileImage.kf.setImage(with: URL(string:user.profileImageUrl))
        }
        return cell
    }

}
extension FollowerListViewController: UICollectionViewDelegate {
    
}
