//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by Joe on 2019/1/11.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit

class WalkthroughContentViewController : UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton!

    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)

        pageControl.currentPage = index

        switch index {
        case 0...1:
            nextButton.setTitle("NEXT", for: .normal)
        case 2:
            nextButton.setTitle("DONE", for: .normal)
        default:
            break
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        switch index {
        case 0...1:
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index)
        case 2:
            UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
            dismiss(animated: true, completion: nil)

            if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
                let bundleIdentifier = Bundle.main.bundleIdentifier
                let shortcutItem1 = UIApplicationShortcutItem(type: "\(bundleIdentifier ?? "")).OpenFavoraties", localizedTitle: "Show Favorites", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "favorite-shortcut"), userInfo: nil)

                let shortcutItem2 = UIApplicationShortcutItem(type: "\(bundleIdentifier ?? "").OpenDiscover", localizedTitle: "Discover Restaurant", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "discover-shortcut"), userInfo: nil)

                let shortcutItem3 = UIApplicationShortcutItem(type: "\(bundleIdentifier ?? "").NewRestaurant", localizedTitle: "New Restaurant", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(type: .add), userInfo: nil)

                UIApplication.shared.shortcutItems = [shortcutItem1, shortcutItem2, shortcutItem3]
            }
        default:
            break
        }
    }

}
