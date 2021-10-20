//
//  UserViewModel.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import Foundation

class UserViewModel{
    
    weak var vc: ViewController?
    var arrUsers = [UserModel]()
    
    
    
    func getAllUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/users")!) { (data, response, error) in
            
            if error == nil{
                
                if let data = data {
                    do{
                        if let httpResponse = response as? HTTPURLResponse{
                            if httpResponse.statusCode == 200{
                                let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                                self.arrUsers.append(contentsOf: userResponse)
                                
                            }else if httpResponse.statusCode == 404 {
                                print("The resource cannot be found")
                            }else if httpResponse.statusCode == 500{
                                print("Internal server error")
                            }else{
                                print("Something went wrong, please try again")
                            }
                        }
                        
                        DispatchQueue.main.async{
                            self.vc?.tblUser.reloadData()
                        }
                    }catch let err{
                        
                        print(err.localizedDescription)
                        
                    }
                }
            }else{
                print(error?.localizedDescription)
            }
        }.resume()
    }
    
}
