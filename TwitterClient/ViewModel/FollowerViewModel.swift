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
    
    init(credential: OAuthSwiftCredential) {
        self.credential = credential
    }
    
    func getFollowers(completion:@escaping (_ users: [User]?)->()) {
        let requestClosure = {[weak self] (endpoint: Endpoint<TwitterTarget>, done: MoyaProvider.RequestResultClosure) in
            do {
                var request = try endpoint.urlRequest()
                // Modify the request however you like.
                let headers = request.allHTTPHeaderFields ?? [:]
                guard let url = request.url, let httpMethod = request.httpMethod, let method = OAuthSwiftHTTPRequest.Method(rawValue: httpMethod) else {
                    return
                }
                var requestHeaders = self?.credential.makeHeaders(url, method: method, parameters: [:])
                headers.forEach({ key, value in
                    requestHeaders?[key] = value
                })
                request.allHTTPHeaderFields = requestHeaders
                
                done(.success(request))
            } catch {
                done(.failure(MoyaError.underlying(error, nil)))
            }
            
        }
        provider = MoyaProvider<TwitterTarget>(requestClosure: requestClosure)
        
        provider?.request(TwitterTarget.followers, completion: { result in
            switch result {
            case .success(let response):
                let jsonDecoder = JSONDecoder()
                let model = try? jsonDecoder.decode(TwitterResponse.self, from: response.data)
                print(model)
                print(try? response.mapJSON())
                completion(model?.users)
            case .failure(let error):
                print(error)
                completion(nil)
            }
        })
    }
}
