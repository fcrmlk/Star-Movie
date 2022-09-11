//
//  DataManager.swift
//  Haid3r
//
//  Created by a on 27/10/2020.
//  Copyright © 2020 Haider Awan. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()

    
    //MARK: - Users Data
    
    func setID(value: Int) {
        UserDefaults.standard.set(value, forKey: "tvID")
    }
    
    func getID() -> Int {
        return UserDefaults.standard.integer(forKey: "tvID")
    }
}
