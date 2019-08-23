//
//  AuthenticationServices.swift
//  AuthenSDK
//
//  Created by nhatle on 8/23/19.
//  Copyright © 2019 VNG. All rights reserved.
//

import Foundation
extension URL {
    public var queryParameters: [String: String]? {
        guard
            let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems else { return nil }
        return queryItems.reduce(into: [String: String]()) { (result, item) in
            result[item.name] = item.value
        }
    }
}
public class AuthenticationService {
    public static let shared = AuthenticationService()
    private var callBack: (([String: Any]) -> ())?
    public func login(completion: @escaping ([String: Any]) -> ()) {
        let url = URL(string: "authen-1234567890://?")!
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) {[weak self] (done) in
                self?.callBack = completion
            }
        } else {
            print("Invalid url:\(url)")
        }
    }
    
    public func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        guard let json = url.queryParameters else {
            //TODO: Callback error with invalid param
            return true
        }
        self.callBack?(json)
        return true
    }
}
