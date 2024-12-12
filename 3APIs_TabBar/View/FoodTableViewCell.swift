//
//  foodTableViewCell.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodGroupName: UILabel!
    
    @IBOutlet weak var foodGroupImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
