//
//  ItemCell.swift
//  TestApp
//
//  Created by Gennadiy Mishin on 01/12/2018.
//  Copyright © 2018 Gennadiy Mishin. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.clipsToBounds = true
        containerView.layer.borderColor = UIColor(red: 209/255, green: 209/255, blue: 209/255, alpha: 1.0).cgColor
        containerView.layer.borderWidth = 1.0
    }

}
