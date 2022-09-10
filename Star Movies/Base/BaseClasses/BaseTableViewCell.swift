//
//  BaseTableViewCell.swift
//  Waste2x
//
//  Created by HaiDer's Macbook Pro on 25/08/2022.
//  Copyright © 2021 Haider Awan. All rights reserved.
//

import UIKit
import SDWebImage

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(imageView:UIImageView,url:String,placeHolder : String = "dummy")  {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_imageIndicator?.startAnimatingIndicator()
        imageView.sd_setImage(with: URL(string: url)!) { (img, err, cahce, URI) in
            imageView.sd_imageIndicator?.stopAnimatingIndicator()
            if err == nil{
                imageView.image = img
            }else{
                imageView.image = UIImage(named: placeHolder)
            }
        }
    }
    
}
