//
//  TranscodingVC.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//


import UIKit

class MealsVC: UIViewController {

    @IBOutlet weak var mealsTableView: UITableView!
    let url = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
    
    var meals: Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealsTableView.dataSource = self
        mealsTableView.delegate = self
        loadMealsData()
//        mealsTableView.dataSource = self
//        mealsTableView.estimatedRowHeight = 100
    }

    @MainActor
    func loadMealsData(){
       
        Task{
            do{
                let meals: Meals = try await NetworkManager.sharedInstance.fetchData(from: url)
                self.meals = meals
                self.mealsTableView?.reloadData()
//                print(self.meals)
                
                
            } catch {
                print("Error : \(error)")
            }
        }
        
    }

}
//

extension MealsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print(meals?.meals[section].strMeal)
        return meals?.meals.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mealsCell") as? MealsTableViewCell else {
            return UITableViewCell()
        }
        
        let meal = meals?.meals[indexPath.row]
        cell.mealsTitle.text = meal?.strMeal
        let imageURL = meal?.strMealThumb
        
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async(){
                cell.mealsImg.image = image
            }
        }
        return cell
    }

}

extension MealsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let newScreen = storyboard?.instantiateViewController(withIdentifier: "MealDetailsVC") as? MealDetailsVC else {
            return
        }
        
        navigationController?.pushViewController(newScreen, animated: true)
        
        let mealDetails = meals?.meals[indexPath.row]
        newScreen.meal = mealDetails
        
        
        let imageURL = mealDetails?.strMealThumb ?? ""
        
        ImageDownloader.shared.getImage(url: imageURL) { image in
            DispatchQueue.main.async(){
                newScreen.mealImg.image = image
            }
        }
        
    }
}
