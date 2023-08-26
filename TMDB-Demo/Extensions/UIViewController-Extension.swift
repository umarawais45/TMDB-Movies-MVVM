//
//  UIViewController-Extension.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import UIKit

extension UIViewController {
    static var storyboardIdentifier: String {
       return String(describing: self)
    }
}
