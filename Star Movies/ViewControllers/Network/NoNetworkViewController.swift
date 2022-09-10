//
//  NoNetworkViewController.swift
//  Appointer
//
//  Created by HaiDer's Macbook Pro on 25/08/2022.
//

import UIKit

class NoNetworkViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    @IBAction func tryAgainAction(_ sender: Any) {
        if Reachability.isConnectedToNetwork() {
            self.navigationController?.popViewController(animated: true)
        }
        else {
            self.showToast(message: "Not Found")
        }
    }
    
    
    
}
