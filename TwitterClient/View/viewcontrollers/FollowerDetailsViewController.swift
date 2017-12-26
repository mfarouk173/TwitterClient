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
    
    var viewModel: FollowerViewModel!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
      @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var tweetsTable: UITableView!
    
    lazy var follower: User? = viewModel.follower
    var tweets: [Tweet]? {
        didSet {
            tweetsTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetsTable.delegate = self
        tweetsTable.dataSource = self
        tweetsTable.estimatedRowHeight = 200
//        tweetsTable.auto
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
        
        viewModel.getTweets { [weak self] tweets in
            self?.tweets = tweets
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
        if let tweets = tweets {
            return tweets.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell") as? TweetTableCell
        
        cell?.nameLabel.text = follower?.name
        cell?.handleLabel.text = follower?.handle
        if let profileImageUrl = follower?.profileImageUrl, let url = URL(string: profileImageUrl) {
            cell?.profileImageView.kf.indicatorType = .activity
            cell?.profileImageView.kf.setImage(with: url)
        }
        if let tweet = tweets?[indexPath.row] {
            cell?.tweetTextLabel.text = tweet.text
        }
        return cell!
    }
}

extension FollowerDetailsViewController: UITableViewDelegate {
    
}
