//
//  UserProfileVC.swift
//  MVVM+Json
//
//  Created by Admin on 19/10/21.
//

import UIKit
import youtube_ios_player_helper
class UserProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, YTPlayerViewDelegate {
    
    @IBOutlet weak var playerView: YTPlayerView!
    var imgageRef = UIImageView()
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var userImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userImg.layer.borderWidth = 1
        userImg.layer.masksToBounds = false
        userImg.layer.borderColor = UIColor.black.cgColor
        userImg.layer.cornerRadius = userImg.frame.height/2
        userImg.clipsToBounds = true
        let cameraTap = UITapGestureRecognizer(target: self, action: #selector(cameraTapped))
        userImg.isUserInteractionEnabled = true
        userImg.addGestureRecognizer(cameraTap)
        imagePicker.delegate = self
        playerView.load(withVideoId: "x7qPAY9JqE4")
        playerView.delegate = self
    }
    @objc func cameraTapped(tapGesture:UITapGestureRecognizer){
        imagegetgallary()
    }
    override func viewWillDisappear(_ animated: Bool) {
        playerView.stopVideo()
    }
    
    @IBAction func BackBtnTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
extension UserProfileVC {
    func imagegetgallary(){
        
        let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil,preferredStyle: UIAlertController.Style.actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.openCamera(UIImagePickerController.SourceType.camera)
        }
        let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertAction.Style.default) {
            UIAlertAction in
            self.openCamera(UIImagePickerController.SourceType.photoLibrary)
        }
        let cancelAction = UIAlertAction(title: "Cancel",style:UIAlertAction.Style.cancel) {
            UIAlertAction in
        }
        // Add the actions
        
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    func openCamera(_ sourceType: UIImagePickerController.SourceType) {
        imagePicker.sourceType = sourceType
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let indexPath = NSIndexPath(row: 0, section: 0)
        userImg.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        let image = tempImage!.jpegData(compressionQuality: 0.2)
        let path = try! FileManager.default.url(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask, appropriateFor: nil, create: false)
        let imageName = UUID().uuidString + ".jpg"
        print(imageName)
        let aPath = path.path
        let imagePath = (aPath as NSString).appendingPathComponent(imageName)
        do {
            
        } catch let error {
            print(error)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("imagePickerController cancel")
    }
}
