//
//  HomeViewController.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient.shared.getTvDetail(endPoint: "3") {
            switch $0 {
            case .failure(_):
                print("kaput :c")
            case let .success(Tv):
                let endpoint = "\(Tv.id ?? 0)/season/\(Tv.seasons.first?.seasonNumber ?? 0)"
             ApiClient.shared.getSesoneDetail(endPoint:endpoint ) {
                switch $0 {
                case .failure(_):
                    print("kaput :c")
                case let .success(sesone):
                        print(sesone.episodes)
                }
                 print(Tv.spokenLanguages.first?.iso6391 ?? "")
            }
        }
            
            
    }

    }
    
}
