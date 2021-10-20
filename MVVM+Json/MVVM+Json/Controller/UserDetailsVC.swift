//
//  UserDetailsVC.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import UIKit

class UserDetailsVC: UIViewController {
    
    @IBOutlet weak var BtnStar: UIButton!
    var dataFromPrev: UserModel?
    var isCheck:Bool = true
    @IBOutlet weak var lblbs: UILabel!
    @IBOutlet weak var lblcatchPhrase: UILabel!
    @IBOutlet weak var lblzipcode: UILabel!
    @IBOutlet weak var lblcity: UILabel!
    @IBOutlet weak var lblsuite: UILabel!
    @IBOutlet weak var lblstreet: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblPhonweb: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        lblUserName.text = dataFromPrev?.username
        lblPhonweb.text = (dataFromPrev?.phone!)! + "-" + (dataFromPrev?.website!)!
        lblCompanyName.text = dataFromPrev?.company?.name
        lblcatchPhrase.text = dataFromPrev?.company?.catchPhrase
        lblbs.text = dataFromPrev?.company?.bs
        lblstreet.text = dataFromPrev?.address?.street
        lblsuite.text = dataFromPrev?.address?.suite
        lblcity.text = dataFromPrev?.address?.city
        lblzipcode.text = dataFromPrev?.address?.zipcode
        
      
    }
    
    @IBAction func BackBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func NextBtnTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        navigationController?.pushViewController(vc, animated: true)
    }
    

    @IBAction func starBtnTapped(_ sender: UIButton) {
        isCheck = !isCheck
        if isCheck {
            BtnStar.tintColor = .systemBlue
            
        }else{
            BtnStar.tintColor = .gray
        }
    }
 
}

