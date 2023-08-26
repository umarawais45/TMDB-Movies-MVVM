//
//  UIImageView-Extension.swift
//  TMDB-Demo
//
//  Created by Umar Awais on 26/08/2023.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(from urlString: String, placeholderImage: UIImage? = nil) {
        let url = URL(string: urlString)
        guard let imageURL = url else { return }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: imageURL) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else if let placeholderImage {
                DispatchQueue.main.async {
                    self?.image = placeholderImage
                }
            }
        }
    }
}
