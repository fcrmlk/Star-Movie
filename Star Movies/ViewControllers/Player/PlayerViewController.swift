//
//  PlayerViewController.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 11/09/2022.
//

import UIKit
import StreamingKit

class PlayerViewController: BaseViewController {
    
    @IBOutlet weak var playerView: UIView!
    
    private let videoPlayer = StreamingVideoPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupVideoPlayer()
    }
    
    
    
    //MARK: - Functions
    
    private func setupVideoPlayer() {
        videoPlayer.add(to: self.playerView)
        videoPlayer.play(url: URL(string: ApiRoutes.sampleVideo)!)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
