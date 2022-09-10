//
//  EpisodesTableViewCell.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 11/09/2022.
//

import UIKit

class EpisodesTableViewCell: BaseTableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func playButtonMayBeAction(_ sender: Any) {
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        
    }
    func config(data:Season?) {
        self.nameLbl.text = data?.name
        self.setImage(imageView: imgView, url: ApiRoutes.imageBaseUrl + (data?.posterPath ?? "/s22fRhj8xFPbiexrJwiAOcDEIrS.png"))
    }
    
}
