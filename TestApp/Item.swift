//
//  Item.swift
//  TestApp
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import UIKit

struct Item: Codable {
    var title: String
    var description: String
    var price: Double
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case title = "restaurant"
        case description = "food_name"
        case price
        case imageURL = "image_url"
    }

}
