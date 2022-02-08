//
//  Extension+UIImageView.swift
//  OrangeNewsTask
//
//  Created by maika on 08/02/2022.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func loadImage(with stringUrl: String) {
        guard let url = URL(string: stringUrl) else { return }
        
        if let image = imageCache.object(forKey: stringUrl as NSString) as? UIImage {
            self.image = image
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        imageCache.setObject(image, forKey: stringUrl as NSString)
                        self?.image = image
                    }
                }
            }
        }
    }
}
