//
//  UIViewExtension.swift
//  Onboardig0.2
//
//  Created by Vladislav on 12/3/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}


//extension UIImage {
//
//    class func imageWithColor(colorOne: UIColor) -> UIImage {
//        let rect = CGRect(x: -0.5, y: 0.0, width: 1.0, height: 1.0)
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
//        colorOne.setFill()
//        UIRectFill(rect)
//        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//
//        UIGraphicsEndImageContext()
//        return image
//    }
//}
