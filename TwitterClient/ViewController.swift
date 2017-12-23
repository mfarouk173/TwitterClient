//
//  ViewController.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/23/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {
    
    var oauthswift: OAuth1Swift?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // create an instance and retain it
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.global(qos: .background).async {
            self.oauthswift = OAuth1Swift(
                consumerKey:    "bk8Zb9loMNm2D6Ko1WBQhjtnZ",
                consumerSecret: "iFCqylf6CizCefj36cigrTLHVtNiXJTDqqpDybAbZJbar8jTTV",
                requestTokenUrl: "https://api.twitter.com/oauth/request_token",
                authorizeUrl:    "https://api.twitter.com/oauth/authorize",
                accessTokenUrl:  "https://api.twitter.com/oauth/access_token"
            )
            // authorize
            let handle = self.oauthswift?.authorize(
                withCallbackURL: "http://oauthswift.herokuapp.com/callback/eventtustwitter",
                success: { credential, response, parameters in
                    print(credential.oauthToken)
                    print(credential.oauthTokenSecret)
                    print(parameters["user_id"])
                    // Do your request
            },
                failure: { error in
                    print(error.localizedDescription)
            }
            )
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

