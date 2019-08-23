//
//  AuthenticationServices.swift
//  AuthenSDK
//
//  Created by nhatle on 8/23/19.
//  Copyright © 2019 VNG. All rights reserved.
//

import Foundation
public class AuthenticationService {
    public static let shared = AuthenticationService()
    public func login(completion: @escaping ([String: Any]) -> ()) {
        let url = URL(string: "authen-1234567890://?")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (done) in
                let json = [
                    "userid": "123456",
                    "token": "abcxyz123"
                ]
                completion(json)
            }
        } else {
            print("Invalid url:\(url)")
        }
    }
}
