//
//  UIImageView + Extension.swift
//  PrimsaTestDemo
//
//  Created by JJMac on 25/07/24.
//

import UIKit
import Kingfisher


extension UIImageView {
    func setImage(with urlString: String){
        guard let url = URL.init(string: urlString) else {return}
        let resource = KF.ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource,options: [.processor(SVGImgProcessor())],completionHandler: { result in
            switch result {
            case .success(let value):
                print("Image loaded successfully: \(value.source.url?.absoluteString ?? "")")
                self.setImageSize(width: 90, height: 50)
            case .failure(let error):
                print("Image loading failed: \(error.localizedDescription)")
            }
        })
        
        
    }
    
    private func setImageSize(width: CGFloat, height: CGFloat) {
            // Setting downloaded image size
            self.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                self.widthAnchor.constraint(equalToConstant: width),
                self.heightAnchor.constraint(equalToConstant: height)
            ])
        }
    
}
