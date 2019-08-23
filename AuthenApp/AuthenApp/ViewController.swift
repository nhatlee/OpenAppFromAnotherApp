//
//  ViewController.swift
//  AuthenApp
//
//  Created by nhatle on 8/23/19.
//  Copyright © 2019 VNG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func denied(_ sender: Any) {
        
    }
    
    @IBAction func accept(_ sender: Any) {
        let url = URL(string: "chat-010101://?userid=123456&token=abc..xyz")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:]) { (completed) in
                print("Success callback")
            }
        } else {
            print("Invalid url: \(url)")
        }
    }
    
}

