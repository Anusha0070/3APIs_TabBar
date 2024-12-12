//
//  ViewController.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class MainVC: UITabBarController, UITabBarControllerDelegate {

    let userVC = UserVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // Identify the selected tab
        if let index = tabBarController.viewControllers?.firstIndex(of: viewController) {
           
//           print
        }
    }

   
}
