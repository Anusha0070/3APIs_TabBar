//
//  MealsTableViewCell.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class MealsTableViewCell: UITableViewCell {

    @IBOutlet weak var mealsTitle: UILabel!
    @IBOutlet weak var mealsImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
