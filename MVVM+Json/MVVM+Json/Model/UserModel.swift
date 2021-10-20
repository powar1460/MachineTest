//
//  UserModel.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import Foundation
import UIKit

struct UserModel : Codable {
    
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var address: AddressDetails?
    var phone: String?
    var website: String?
    var company: CompanyDetails?

    
    struct AddressDetails: Codable {
        var street,suite,city,zipcode: String?
        var geo: addressGeoDetails?
    }
    
    struct addressGeoDetails: Codable {
        var lat,long: String?
    }
    
    struct CompanyDetails: Codable {
        var name: String?
        var catchPhrase: String?
        var bs: String?
    }
    

}
