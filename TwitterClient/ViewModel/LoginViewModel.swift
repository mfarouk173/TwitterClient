//
//  LoginViewModel.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift

class LoginViewModel {
    var oauthswift: OAuth1Swift?
    var credential: OAuthSwiftCredential?
    var coordinatorDelegate: LoginCoordinatorDelegate?
    
    func authenticate(){
        UIHelpers.showLoader()
        DispatchQueue.global(qos: .background).async {
            self.oauthswift = OAuth1Swift(
                consumerKey:    Constants.Twitter.consumerKey,
                consumerSecret: Constants.Twitter.consumerSecret,
                requestTokenUrl: Constants.Twitter.requestTokenUrl,
                authorizeUrl:    Constants.Twitter.authorizeUrl,
                accessTokenUrl:  Constants.Twitter.accessTokenUrl
            )
            // authorize
            _ = self.oauthswift?.authorize(
                withCallbackURL: Constants.Twitter.callbackUrl,
                success: { [weak self] credential, response, parameters in
                    print(credential.oauthToken)
                    print(credential.oauthTokenSecret)
                    
                    self?.credential = credential
                    
                    UIHelpers.hideLoader()
                    self?.coordinatorDelegate?.loginDidSuccess(credential: credential)
                },
                failure: {[weak self] error in
                    print(error.localizedDescription)
                    UIHelpers.hideLoader()
                    self?.coordinatorDelegate?.loginDidFail(error: error)
                }
            )
        }
    }
}
