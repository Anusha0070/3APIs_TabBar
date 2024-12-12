//
//  UserVC.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import UIKit

class UserVC: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var user : UserModel?
    var url : String = "https://swapi.py4e.com/api/people/1/?format=json"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.dataSource = self
        userTableView.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }
    @MainActor
    func loadData(){
        Task{
            do{
                let userData: UserModel = try await NetworkManager.sharedInstance.fetchData(from: url)
                self.user = userData
                self.userTableView?.reloadData()
                
                
            } catch {
                print("Error : \(error)")
            }
        }
        
    }

}

extension UserVC : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if user != nil {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserTableViewCell else{
            return UITableViewCell()
        }
        
        cell.userName.text = user?.name

        return cell
    }
}

extension UserVC : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let newScreen = storyboard?.instantiateViewController(withIdentifier: "UserDetailsVC") as? UserDetailsVC else {
            return
        }
        
        navigationController?.pushViewController(newScreen, animated: true)
        
        let userDetails = user
        
        newScreen.userDetails = userDetails
        
    }
}
