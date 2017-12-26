//
//  FollowerViewModel.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/25/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import Moya
import OAuthSwift

class FollowerViewModel {
    var provider: MoyaProvider<TwitterTarget>?
    var credential: OAuthSwiftCredential
    var coordinatorDelegate: FollowerListCoordinatorDelegate?
    
    var follower:User!
    
    lazy var requestClosure = { (endpoint: Endpoint<TwitterTarget>, done: MoyaProvider.RequestResultClosure) in
        do {
            var request = try endpoint.urlRequest()
            // Modify the request however you like.
            let headers = request.allHTTPHeaderFields ?? [:]
            guard let url = request.url, let httpMethod = request.httpMethod, let method = OAuthSwiftHTTPRequest.Method(rawValue: httpMethod) else {
                return
            }
            var params:[String:Any] = [:]
            switch endpoint.task {
            case .requestParameters(let parameters, _):
                params = parameters
            default:
                break
            }
            
            // removing query parms from url so that oauth signature do not fail
            guard let scheme = url.scheme, let host = url.host, let urlWithoutQueryParams = URL(string:"\(scheme)://\(host)\(url.path)") else {
                return
            }
            var requestHeaders = self.credential.makeHeaders(urlWithoutQueryParams, method: method, parameters: params)
            headers.forEach({ (arg) in
                let (key, value) = arg
                requestHeaders[key] = value
            })
            request.allHTTPHeaderFields = requestHeaders
            
            done(.success(request))
        } catch {
            done(.failure(MoyaError.underlying(error, nil)))
        }
        
    }
    
    init(credential: OAuthSwiftCredential) {
        self.credential = credential
        provider = MoyaProvider<TwitterTarget>(requestClosure: requestClosure)
    }
    
    init(credential: OAuthSwiftCredential, follower:User) {
        self.credential = credential
        self.follower = follower
        provider = MoyaProvider<TwitterTarget>(requestClosure: requestClosure)
    }
    
    func getFollowers(completion:@escaping (_ users: [User]?)->()) {
        UIHelpers.showLoader()
        provider?.request(TwitterTarget.followers(count: 50), completion: { result in
            UIHelpers.hideLoader()
            switch result {
            case .success(let response):
                let jsonDecoder = JSONDecoder()
                let model = try? jsonDecoder.decode(TwitterResponse.self, from: response.data)
                completion(model?.users)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        })
    }

    func showFollowerDetails(follower: User) {
        coordinatorDelegate?.showFollowerDetails(follower: follower)
    }

    func getTweets(completion:@escaping (_ tweets: [Tweet]?)->()) {
        UIHelpers.showLoader()
        provider?.request(TwitterTarget.tweets(handle: follower.handle, count: 10), completion: { result in
            UIHelpers.hideLoader()
            switch result {
            case .success(let response):
                let jsonDecoder = JSONDecoder()
                let model = try? jsonDecoder.decode([Tweet].self, from: response.data)
                
                completion(model)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        })
    }
}
