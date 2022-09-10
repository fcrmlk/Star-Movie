//
//  TitleCollectionViewCell.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 11/09/2022.
//

import UIKit

class TitleCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var bottomLine: UIView!
    @IBOutlet weak var lastLine: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func config(title:String) {
        self.nameLbl.text = title
    }

}
