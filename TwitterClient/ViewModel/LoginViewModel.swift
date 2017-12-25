//
//  LoginViewModel.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import OAuthSwift
import Moya
import RxSwift

class LoginViewModel {
    var oauthswift: OAuth1Swift?
    var credential: OAuthSwiftCredential?
    func authenticate(){
        DispatchQueue.global(qos: .background).async {
            self.oauthswift = OAuth1Swift(
                consumerKey:    Constants.Twitter.consumerKey,
                consumerSecret: Constants.Twitter.consumerSecret,
                requestTokenUrl: Constants.Twitter.requestTokenUrl,
                authorizeUrl:    Constants.Twitter.authorizeUrl,
                accessTokenUrl:  Constants.Twitter.accessTokenUrl
            )
            // authorize
            let _ = self.oauthswift?.authorize(
                withCallbackURL: Constants.Twitter.callbackUrl,
                success: { [weak self] credential, response, parameters in
                    print(credential.oauthToken)
                    print(credential.oauthTokenSecret)
                    
                    self?.credential = credential
                    
                    // Do your request
                    
                    let requestClosure = { (endpoint: Endpoint<TwitterTarget>, done: MoyaProvider.RequestResultClosure) in
                        do {
                            var request = try endpoint.urlRequest()
                            // Modify the request however you like.
                            let headers = request.allHTTPHeaderFields ?? [:]
                            var requestHeaders = credential.makeHeaders(request.url!, method: OAuthSwiftHTTPRequest.Method(rawValue: request.httpMethod!)!, parameters: [:])
                            headers.forEach({ key, value in
                                requestHeaders[key] = value
                            })
                            request.allHTTPHeaderFields = requestHeaders
                            
                            done(.success(request))
                        } catch {
                            done(.failure(MoyaError.underlying(error, nil)))
                        }
                        
                    }
                    let provider = MoyaProvider<TwitterTarget>(requestClosure: requestClosure)
                    
                    
                    provider.rx.request(TwitterTarget.followers).subscribe { event in
                        switch event {
                        case .success(let response):
                            let jsonDecoder = JSONDecoder()
                            let model = try? jsonDecoder.decode(TwitterResponse.self, from: response.data)
                            print(model)
                            print(try? response.mapJSON())
                        case .error(let error):
                            print(error)
                        }
                    }
                    
                },
                failure: { error in
                    print(error.localizedDescription)
            }
            )
        }
    }
}
