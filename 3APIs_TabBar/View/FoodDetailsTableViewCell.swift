//
//  FoodDetailsTableViewCell.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class FoodDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var foodItemImg: UIImageView!
    
    @IBOutlet weak var foodItemName: UILabel!
    @IBOutlet weak var foodItemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
