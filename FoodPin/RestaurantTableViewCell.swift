//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by guan on 2019/1/7.
//  Copyright © 2019 guan. All rights reserved.
//

import Foundation
import UIKit

class RestaurantTableViewCell : UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
