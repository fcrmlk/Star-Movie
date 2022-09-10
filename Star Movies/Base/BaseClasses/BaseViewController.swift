//
//  BaseViewController.swift
//  haid3r
//
//  Created by HaiD3R AwaN on 20/05/2021.
//  Copyright © 2021 Haider Awan. All rights reserved.
//

import UIKit
import SDWebImage
import SwiftMessages
import Foundation

class BaseViewController: UIViewController {

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    func imageToBase64(image:UIImage) -> String {
        if let imageData = image.jpeg(.medium) {
            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            return strBase64
        }
        else {
            let imageData:Data = image.pngData()!
            let strBase64 = imageData.base64EncodedString(options: .lineLength64Characters)
            return strBase64
        }
    }
    func base64ToImage(base64:String) -> UIImage? {
        let dataDecoded : Data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters)!
        let decodedimage = UIImage(data: dataDecoded)
        return decodedimage ?? UIImage(named: "addPhoto")
    }
    

    /**************************************************/
    
    @objc func imageSelectedFromGalleryOrCamera(selectedImage:UIImage){
        
    }
    
    func setImage(imageView:UIImageView,url:URL,placeHolder : String = "COVER")  {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.whiteLarge
        imageView.sd_imageIndicator?.startAnimatingIndicator()
        imageView.sd_setImage(with: url) { (img, err, cahce, URI) in
            imageView.sd_imageIndicator?.stopAnimatingIndicator()
            if err == nil{
                imageView.image = img
            }else{
                imageView.image = UIImage(named: placeHolder)
            }
        }
    }
    
    func showToast(message : String, _ type: Theme = .info,_ title:String = "Info" ) {
        let info = MessageView.viewFromNib(layout: .tabView)
        info.configureTheme(type)
        info.configureContent(title: title, body: message)
        info.button?.isHidden = true
        SwiftMessages.show(view: info)
    }

}
