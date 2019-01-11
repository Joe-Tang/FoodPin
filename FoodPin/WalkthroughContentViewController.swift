//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by guan on 2019/1/11.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import UIKit

class WalkthroughContentViewController : UIViewController {

    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var contentImageView: UIImageView!

    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
    }
    
}
