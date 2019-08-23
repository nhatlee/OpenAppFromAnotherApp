//
//  ViewController.swift
//  ChatApp
//
//  Created by nhatle on 8/23/19.
//  Copyright © 2019 VNG. All rights reserved.
//

import UIKit
import AuthenSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginTouch(_ sender: Any) {
        AuthenticationService.shared.login { (json) in
            print(json)
        }
    }
    
}

