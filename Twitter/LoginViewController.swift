//
//  LoginViewController.swift
//  Twitter
//
//  Created by Rachel Chen on 3/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.borderWidth = 1
        loginButton.layer.cornerRadius = 15
    }
    

    @IBAction func onTapLogin(_ sender: Any) {
        let urlString = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: urlString, success: {
            // on login success, present homeTableVC
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Error. Could not log in.")
            let title = "Error"
            let message = "An error has occured. Unable to log-in."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
