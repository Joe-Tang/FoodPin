//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Joe on 2019/1/9.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit

class ReviewViewController : UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var topImageView: UIImageView!
    @IBOutlet var closeButton: UIButton!

    var restaurant: Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let restaurant = self.restaurant {
            let image = UIImage(named: restaurant.image)
            backgroundImageView.image = image
            topImageView.image = image
        }

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
 
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        closeButton.transform = CGAffineTransform.init(scaleX: 100, y: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)

        UIView.animate(withDuration: 0.3, animations: {
            self.containerView.transform = CGAffineTransform.identity
        })
  
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.3, options: .curveEaseInOut, animations: {
            self.closeButton.transform = CGAffineTransform.identity
        }, completion: nil)
    }

}
