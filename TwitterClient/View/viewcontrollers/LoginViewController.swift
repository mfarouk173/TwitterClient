//
//  ViewController.swift
//  TwitterClient
//
//  Created by Mohamed Farouk on 12/23/17.
//  Copyright © 2017 Mohamed Farouk. All rights reserved.
//

import UIKit
import RevealingSplashView

final class LoginViewController: UIViewController, Instantiatable {
    static var viewControllerId: ViewContollerId {
        return .loginViewController
    }
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // create an instance and retain it
        //Initialize a revealing Splash with with the iconImage, the initial size and the background color
        let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "Twitter_Logo_WhiteOnImage"),iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red:0.11, green:0.56, blue:0.95, alpha:1.0))
        
        //Adds the revealing splash view as a sub view
        self.view.addSubview(revealingSplashView)
        
        //Starts animation
        revealingSplashView.delay = 1.0
        revealingSplashView.startAnimation(){
            print("Completed")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func loginWithTwitterTapped(_ sender: Any) {
        viewModel.authenticate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

