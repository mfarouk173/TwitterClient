//
//  UIHelpers.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/26/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class UIHelpers {
    class func showLoader() {
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    class func hideLoader() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
}
