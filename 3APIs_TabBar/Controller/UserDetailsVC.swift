//
//  UserDetailsVC.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/12/24.
//


import UIKit

class UserDetailsVC: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    var userDetails: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let userDetails = userDetails {
            name.text = userDetails.name
            height.text = userDetails.height
            mass.text = userDetails.mass
            birthYear.text = userDetails.birth_year
            gender.text = userDetails.gender
        }
    }


}

