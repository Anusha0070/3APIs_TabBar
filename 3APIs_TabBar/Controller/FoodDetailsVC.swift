//
//  FoodDetailsVC.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//


import UIKit

class FoodDetailsVC: UIViewController {

    @IBOutlet weak var foodDetailsTableView: UITableView!
    
    var foodItemDetails: [FoodItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodDetailsTableView.dataSource = self
        foodDetailsTableView.delegate = self
    }


}

extension FoodDetailsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItemDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodDetailCell") as? FoodDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        let foodItem = foodItemDetails?[indexPath.row]
        
        cell.foodItemName.text = foodItem?.name
        cell.foodItemPrice.text = String(foodItem?.price ?? 0)
        
        let imageURL = foodItem?.image_url
        
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async(){
                cell.foodItemImg.image = image
            }
        }
        return cell
    }
}

extension FoodDetailsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
