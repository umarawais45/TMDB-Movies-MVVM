//
//  Connectivity.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import Alamofire

struct Connectivity {
    private static let sharedInstance = NetworkReachabilityManager()
    static var isConnectedToInternet: Bool {
        return self.sharedInstance?.isReachable ?? true
    }
}
