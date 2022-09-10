//
//  Global.swift
//  StacyView
//
//  Created by Haider Awan on 11/01/2021.
//

import Foundation
import UIKit
import CoreLocation

class Global {
    class var shared : Global {
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    
    
    
    
}
