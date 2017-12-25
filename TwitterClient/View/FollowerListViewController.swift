//
//  FollowerListViewController.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/24/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import RxCocoa


final class FollowerListViewController: UIViewController, Instantiatable {
    static var viewControllerId: ViewContollerId {
        return .followerListViewController
    }
    
    var viewModel: FollowerViewModel!

    @IBOutlet weak var collectionView: UICollectionView!
    var users: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        collectionView.rx.items()
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel.set()
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }

}
extension FollowerListViewController: UICollectionViewDelegate {
    
}
