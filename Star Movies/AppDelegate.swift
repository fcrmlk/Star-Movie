//
//  AppDelegate.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UISceneDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.setupWindow()
        return true
    }
    
    private func setupWindow() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.placeholderColor = .white
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        let nav = UINavigationController()
        nav.navigationBar.isHidden = true
        nav.viewControllers = [HomeViewController()]
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }

}

