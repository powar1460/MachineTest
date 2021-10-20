 //
 //  ProgressHUD.swift
 //  NGO
 //
 //  Created by Sarvesh Doshi on 09/01/21.
 //  Copyright © 2021 Nishita Shukla. All rights reserved.
 //
 //  Activtyindicator.swift
 //  MytmApp
 //
 //  Created by Viabhav Powar on 12/01/21.
  // Copyright © 2021 Viabhav Powar. All rights reserved.//////
 //
 import UIKit
 let SCREEN_WIDTH = UIScreen.main.bounds.size.width
 let SIZE_CONSTANT = 375.0
 let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

 //@available(iOS 13.0, *)
 class ERProgressHud {
     static let sharedInstance = ERProgressHud()
     
     var container = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
     var subContainer = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH / 3.0, height: SCREEN_WIDTH / 4.0))
     var textLabel = UILabel()
     var activityIndicatorView = UIActivityIndicatorView()
     var blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
     //
     init() {
         //Main Container
         container.backgroundColor = UIColor.clear
         
         //Sub Container
         subContainer.layer.cornerRadius = 5.0
         subContainer.layer.masksToBounds = true
         subContainer.backgroundColor = UIColor.clear
         
         //Activity Indicator
         activityIndicatorView.hidesWhenStopped = true
         
         //Text Label
         textLabel.textAlignment = .center
         textLabel.numberOfLines = 0
         textLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
         textLabel.textColor = UIColor.darkGray
         
         //Blur Effect
         //always fill the view
         blurEffectView.frame = container.bounds
         blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     }
     
     func show() -> Void {
         
         container.backgroundColor = UIColor.black.withAlphaComponent(0.60)
         if #available(iOS 13.0, *) {
             activityIndicatorView.style = UIActivityIndicatorView.Style.large
         } else {
             // Fallback on earlier versions
             activityIndicatorView.style = .white
         }
         activityIndicatorView.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
         activityIndicatorView.color = UIColor.white
         
         activityIndicatorView.startAnimating()
         container.addSubview(activityIndicatorView)
         if let window = getKeyWindow() {
             window.addSubview(container)
         }
         container.alpha = 0.0
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 1.0
         })
     }
     
     func showWithBlurView() {
         
         //only apply the blur if the user hasn't disabled transparency effects
         if !UIAccessibility.isReduceTransparencyEnabled {
             container.backgroundColor = UIColor.clear
             container.addSubview(blurEffectView)
         } else {
             container.backgroundColor = UIColor.black.withAlphaComponent(0.60)
         }
         
         if #available(iOS 13.0, *) {
             activityIndicatorView.style = UIActivityIndicatorView.Style.large
         } else {
             // Fallback on earlier versions
             activityIndicatorView.style = .white
         }
         activityIndicatorView.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
         activityIndicatorView.color = UIColor.white

         activityIndicatorView.startAnimating()
         container.addSubview(activityIndicatorView)
         if let window = getKeyWindow() {
             window.addSubview(container)
         }
         container.alpha = 0.0
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 1.0
         })
     }
     
     func hide() {
         
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 0.0
         }) { finished in
             self.activityIndicatorView.stopAnimating()
             
             self.activityIndicatorView.removeFromSuperview()
             self.textLabel.removeFromSuperview()
             self.subContainer.removeFromSuperview()
             self.blurEffectView.removeFromSuperview()
             self.container.removeFromSuperview()
         }
     }
     
     func show(withTitle title: String?) {
         
         container.backgroundColor = UIColor.clear
         
         if #available(iOS 13.0, *) {
             subContainer.backgroundColor = UIColor.systemGroupedBackground
         } else {
             // Fallback on earlier versions
             subContainer.backgroundColor = UIColor.white
         }
         subContainer.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
         container.addSubview(subContainer)
         
         if #available(iOS 13.0, *) {
             activityIndicatorView.style = UIActivityIndicatorView.Style.large
         } else {
             // Fallback on earlier versions
             activityIndicatorView.style = .white
         }
         activityIndicatorView.color = UIColor.black
         activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
         activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
         subContainer.addSubview(activityIndicatorView)
         
         let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
         textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
         textLabel.text = title
         subContainer.addSubview(textLabel)
         
         activityIndicatorView.startAnimating()
         if let window = getKeyWindow() {
             window.addSubview(container)
         }
         container.alpha = 0.0
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 1.0
         })
     }
     
     func showDarkBackgroundView(withTitle title: String?) {
         
         container.backgroundColor = UIColor.black.withAlphaComponent(0.60)
         
         if #available(iOS 13.0, *) {
             subContainer.backgroundColor = UIColor.systemGroupedBackground
         } else {
             // Fallback on earlier versions
             subContainer.backgroundColor = UIColor.white
         }
         subContainer.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
         container.addSubview(subContainer)
         
                 if #available(iOS 13.0, *) {
             activityIndicatorView.style = UIActivityIndicatorView.Style.large
         } else {
             // Fallback on earlier versions
             activityIndicatorView.style = .white
         }
         activityIndicatorView.color = UIColor.black
         activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
         activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
         subContainer.addSubview(activityIndicatorView)
         
         let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
         textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
         textLabel.text = title
         subContainer.addSubview(textLabel)
         
         activityIndicatorView.startAnimating()
         if let window = getKeyWindow() {
            window.addSubview(container)
         }
         container.alpha = 0.0
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 1.0
         })
     }
     
     func showBlurView(withTitle title: String?) {
         
         //only apply the blur if the user hasn't disabled transparency effects
         if !UIAccessibility.isReduceTransparencyEnabled {
             container.backgroundColor = UIColor.clear
             container.addSubview(blurEffectView)
         } else {
             container.backgroundColor = UIColor.black.withAlphaComponent(0.60)
         }
         
        if #available(iOS 13.0, *) {
             subContainer.backgroundColor = UIColor.systemGroupedBackground
         } else {
             // Fallback on earlier versions
             subContainer.backgroundColor = UIColor.white
         }
         activityIndicatorView.color = UIColor.black
         subContainer.center = CGPoint(x: SCREEN_WIDTH / 2, y: SCREEN_HEIGHT / 2)
         container.addSubview(subContainer)
         
                 if #available(iOS 13.0, *) {
             activityIndicatorView.style = UIActivityIndicatorView.Style.large
         } else {
             // Fallback on earlier versions
             activityIndicatorView.style = .white
         }
         activityIndicatorView.frame = CGRect(x: 0, y: 10, width: subContainer.bounds.width, height: subContainer.bounds.height / 3.0)
         activityIndicatorView.center = CGPoint(x: activityIndicatorView.center.x, y: activityIndicatorView.center.y)
         subContainer.addSubview(activityIndicatorView)
         
         let height: CGFloat = subContainer.bounds.height - activityIndicatorView.bounds.height - 10.0
         textLabel.frame = CGRect(x: 5, y: 10 + activityIndicatorView.bounds.height, width: subContainer.bounds.width - 10.0, height: height - 5.0)
         textLabel.text = title
         subContainer.addSubview(textLabel)
         
         activityIndicatorView.startAnimating()
         if let window = getKeyWindow() {
             window.addSubview(container)
         }
         container.alpha = 0.0
         UIView.animate(withDuration: 0.5, animations: {
             self.container.alpha = 1.0
         })
     }
     
     func updateProgressTitle(_ title: String?) {
         textLabel.text = title
     }
     
     private func getKeyWindow() -> UIWindow? {
         var window: UIWindow?
         if #available(iOS 13.0, *) {
             window = UIApplication.shared.connectedScenes
                 .filter({$0.activationState == .foregroundActive})
                 .map({$0 as? UIWindowScene})
                 .compactMap({$0})
                 .first?.windows
                 .filter({$0.isKeyWindow}).first
         } else {
             // Fallback on earlier versions
             window = UIApplication.shared.windows.first
         }
         return window
     }
 }

 //NEW CODE


