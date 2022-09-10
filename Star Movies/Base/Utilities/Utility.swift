//
//  Utility.swift
//  Audtix
//
//  Created by Bilal Saeed on 9/14/19.
//  Copyright © 2019 Bilal Saeed. All rights reserved.
//

import UIKit
import SwiftMessages

var kApplicationWindow = Utility.getAppDelegate()!.window
@objc class Utility: NSObject {
    
    class func showErrorMessage(message:String) {
        let error = MessageView.viewFromNib(layout: .tabView)
        error.configureTheme(.error)
        error.configureContent(title: "Error", body: message)
        error.button?.isHidden = true
        SwiftMessages.show(view: error)
    }
    
    class func showSuccessMessage(message:String) {
        let success = MessageView.viewFromNib(layout: .tabView)
        success.configureTheme(.success)
        success.configureContent(title: "Success", body: message)
        success.button?.isHidden = true
        SwiftMessages.show(view: success)
    }
    
    class func showInfoMessage(message:String) {
        let info = MessageView.viewFromNib(layout: .tabView)
        info.configureTheme(.warning)
        info.configureContent(title: "Info", body: message)
        info.button?.isHidden = true
        SwiftMessages.show(view: info)
    }
    
    class func getAppDelegate() -> AppDelegate? {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate
    }
    
    class func getScreenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    class func getScreenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    class func showAlertController (_ controller: UIViewController,_ message: String) {
        let easyVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        easyVC.modalPresentationStyle = .overCurrentContext
        easyVC.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        controller.present(easyVC, animated: true, completion: nil)
    }
    
    class func hasTopNotch() -> Bool {
        
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        
        return false
    }

    
    @objc class func showLoading(offSet: CGFloat = 0, isVisible: Bool = true) {
        DispatchQueue.main.async {
            if let _ = kApplicationWindow?.viewWithTag(9000) {
                return
            }

            let superView = UIView(frame: CGRect(x: 0, y: 0 - offSet, width: kApplicationWindow?.frame.width ?? 0.0, height: kApplicationWindow?.frame.height ?? 0.0))
            let iconImageView = UIImageView(frame: CGRect(x: superView.frame.width/2 - 32.5, y: superView.frame.height/2 - 32.5, width: 65, height: 65))
            iconImageView.image = UIImage(named: "loading")
            
            if isVisible {
                superView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            
            } else {
                superView.backgroundColor = .clear
            }
            
            superView.tag = 9000
            iconImageView.rotate()
            superView.addSubview(iconImageView)
            superView.bringSubviewToFront(iconImageView)
            kApplicationWindow?.addSubview(superView)
        }

        }
    
    @objc class func hideLoading() {
        DispatchQueue.main.async {
            if let activityView = kApplicationWindow?.viewWithTag(9000) {
                activityView.removeFromSuperview()
            }
        }
    }
    
}
extension UIImageView {
    
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi / 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
