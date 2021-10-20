//
//  UserCell.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var lblStar: UILabel!
    @IBOutlet weak var lblPhoneWeb: UILabel!
    @IBOutlet weak var lblUName: UILabel!
    
    var modelUser: UserModel?{
        didSet{
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func userConfiguration(){
       
        lblUName.text = modelUser?.name ?? "vaibhav"
        lblPhoneWeb.text =  (modelUser?.phone)! + "-" +  (modelUser?.website)!
        lblCompanyName.text = modelUser?.company?.name ?? "--"

    }
    
}
