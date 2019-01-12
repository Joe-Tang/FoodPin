//
//  UIColor+UIImage.swift
//  FoodPin
//
//  Created by Joe on 2019/1/12.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {

    public var imageValue: UIImage {
        let rect = CGRect(origin: .zero, size: CGSize(width: 1, height: 1))
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }

}
