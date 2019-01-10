//
//  Restaurant.swift
//  FoodPin
//
//  Created by Joe on 2019/1/8.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
class Restaurant {
    var name = ""
    var location = ""
    var type = ""
    var image = ""
    var isVisited = false
    var phone = ""
    
    var rating = ""
    
    init(name: String, type: String, location: String,
         phone: String, image: String, isVisited: Bool = false) {
        self.name = name
        self.location = location
        self.type = type
        self.image = image
        self.isVisited = isVisited
        self.phone = phone
    }
}
