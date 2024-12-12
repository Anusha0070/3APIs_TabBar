//
//  Untitled.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class MealDetailsVC: UIViewController {

    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var mealCategory: UILabel!
    
    @IBOutlet weak var mealInstructions: UILabel!
    
    @IBOutlet weak var mealImg: UIImageView!
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let meal else { return }
        
        mealTitle.text = meal.strMeal
        mealCategory.text = meal.strCategory
        mealInstructions.text = meal.strInstructions
        
    }


}
