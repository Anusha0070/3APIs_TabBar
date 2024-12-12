//
//  FoodVC.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//


import UIKit

class FoodVC: UIViewController {

    @IBOutlet weak var foodTableView: UITableView!
    
    var food : FoodData?
    
    var url : String = "https://raw.githubusercontent.com/shobhakartiwari/shobhakar_api_collections/39b4ed9c85833857e7d21c23352bb4857a818919/FoodData.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodTableView.dataSource = self
        foodTableView.delegate = self
        loadFoodData()
    }
    
    @MainActor
    func loadFoodData(){
        Task{
            do{
                let food: FoodData = try await NetworkManager.sharedInstance.fetchData(from: url)
                self.food = food
                self.foodTableView?.reloadData()
                
                
            } catch {
                print("Error : \(error)")
            }
        }
    }
}

extension FoodVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        return food?.food_groups.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as? FoodTableViewCell else{
            return UITableViewCell()
        }
        let foodGroup = food?.food_groups[indexPath.row]
        
        cell.foodGroupName.text = foodGroup?.name
        
        let imageURL = foodGroup?.image_url ?? ""
//
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async(){
//                newScreen.mealImg.image = image
                cell.foodGroupImg.image = image
            }
        }
        
        return cell
    }
    
    
}


extension FoodVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let newScreen = storyboard?.instantiateViewController(withIdentifier: "FoodDetailsVC") as? FoodDetailsVC else {
            return
        }
        
        navigationController?.pushViewController(newScreen, animated: true)
        
        let foodDetails = food?.food_groups[indexPath.row].food_items
//        newScreen.meal = mealDetails
//        print()
//
        
        newScreen.foodItemDetails = foodDetails
        
        

        
    }
}


