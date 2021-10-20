//
//  ViewController.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import UIKit

class ViewController: UIViewController {
   
    var viewModelUser = UserViewModel()
    @IBOutlet weak var tblUser: UITableView!
    var selectedHeaderArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUser.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        viewModelUser.vc = self
        viewModelUser.getAllUserData()
    }
    
    
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        cell?.modelUser = viewModelUser.arrUsers[indexPath.row]
        cell?.startBtn.tag = indexPath.row
        cell?.startBtn.addTarget(self, action: #selector(headerTapped), for: .touchUpInside)
        if selectedHeaderArray.contains(indexPath.row){
            cell?.startBtn.tintColor = .systemBlue
            
        }else{
            cell?.startBtn.tintColor = .gray
            
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
        let dict =  viewModelUser.arrUsers[indexPath.row]
        vc.dataFromPrev = dict
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func headerTapped(sender : UIButton){
        if selectedHeaderArray.contains(sender.tag){
            selectedHeaderArray.remove(sender.tag)
        }else{
            selectedHeaderArray.add(sender.tag)
         
        }
        self.tblUser.reloadData()
    }
}


