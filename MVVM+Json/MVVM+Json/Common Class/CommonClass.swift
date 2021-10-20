//
//  CommonClass.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import Foundation
import UIKit

extension UIViewController{
    func showAlert(title: String = "Alert",
                   message: String,
                   completionHandler  onComplete:@escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler:{
            _ in
            onComplete(true)
        })
        )
        self.present(alert, animated: true, completion: nil)
    }
}
 
