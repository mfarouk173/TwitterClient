//
//  FollowerDetailsViewController.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import Kingfisher
import EZSwiftExtensions

final class FollowerDetailsViewController: UIViewController, Instantiatable {
    static var viewControllerId: ViewContollerId {
        return .followerDetailsViewController
    }
    
    var viewModel: FollowerDetailsViewModel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
      @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var tweetsTable: UITableView!
    lazy var follower: User? = viewModel.follower
    var tweets: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetsTable.delegate = self
        tweetsTable.dataSource = self
        setupUI()
    }
    
    private func setupUI(){
        self.nameLabel.text = follower?.name
        self.title = follower?.name
        if let handle = follower?.handle {
            self.handleLabel.text = "@\(handle)"
        }
        self.bioLabel.text = follower?.bio
        
        profileImageView.roundSquareImage()
        profileImageView.addBorder(width: 2.0, color: .white)
        if let profileImageUrl = follower?.profileImageUrl, let url = URL(string: profileImageUrl) {
            self.profileImageView.kf.indicatorType = .activity
            self.profileImageView.kf.setImage(with: url)
        }
        
        let backgroundImageUrl = follower?.backgroundImageUrl ?? "http://via.placeholder.com/800x400/1DA1F2/ffffff?text=Twitter+is+awesome"
        if let url = URL(string: backgroundImageUrl) {
            self.backgroundImageView.kf.indicatorType = .activity
            self.backgroundImageView.kf.setImage(with: url)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension FollowerDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell")
        return cell!
    }
    
    
}


extension FollowerDetailsViewController: UITableViewDelegate {
    
}
