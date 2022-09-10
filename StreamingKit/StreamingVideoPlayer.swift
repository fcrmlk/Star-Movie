//
//  StreamingVideoPlayer.swift
//  StreamingKit
//
//  Created by HaiDer's Macbook Pro on 17/01/2022.
//

import Foundation
import AVFoundation
import AVKit


public class StreamingVideoPlayer {
    
    private let playerViewController = AVPlayerViewController()
    
    private var avPlayer = AVPlayer()
    
    private lazy var playerView: UIView = {
        let view = playerViewController.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public init() {}
    
    //MARK: - Functions
    
    public func add(to view: UIView) {
        view.addSubview(playerView)
        NSLayoutConstraint.activate([
            playerView.topAnchor.constraint(equalTo: view.topAnchor),
            playerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            playerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            playerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    public func play (url:URL) {
        let player = AVPlayer(url: url)
        self.avPlayer = player
        playerViewController.player = avPlayer
        playerViewController.player?.play()
    }
    
    public func pause() {
        avPlayer.pause()
    }
     
}
