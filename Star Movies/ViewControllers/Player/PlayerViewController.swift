//
//  PlayerViewController.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 11/09/2022.
//

import UIKit
import StreamingKit

class PlayerViewController: BaseViewController {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLBl: UILabel!
    
    //MARK: - Variables
    
    var url = ""
    var isEpisode = false
    var episodeDetail : EpisodeDetails?
    var seasonDetail : SeasoneDetailModel?
    
    private let videoPlayer = StreamingVideoPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHome()
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

//MARK: - API Extention

extension PlayerViewController {
    func setupHome() {
        if isEpisode {
            
            ApiClient.shared.getEpisodeDetail(endPoint: url) {
                switch $0 {
                case .failure(_):break
                case let .success(episodeData):
                    self.episodeDetail = episodeData
                    DispatchQueue.main.async {
                        self.nameLbl.text = episodeData.name
                        self.descriptionLBl.text = episodeData.overview
                    }
                }
            }
        }
        else {
            ApiClient.shared.getSesoneDetail(endPoint: url) {
                switch $0 {
                case .failure(_):break
                case let .success(sesoneData):
                    self.seasonDetail = sesoneData
                    DispatchQueue.main.async {
                        self.nameLbl.text = sesoneData.episodes?.first?.name
                        self.descriptionLBl.text = sesoneData.episodes?.first?.overview
                    }
                }
            }
        }
    }
}
