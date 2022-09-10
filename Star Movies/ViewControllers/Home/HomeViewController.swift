//
//  HomeViewController.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import UIKit

class HomeViewController: BaseViewController {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var yearLbl: UILabel!
    @IBOutlet weak var sesoneLbl: UILabel!
    @IBOutlet weak var RLbl: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var trailerButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var plyerView: UIView!
    
    
    //MARK: - Variables
    

    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient.shared.getTvDetail(endPoint: "3") {
            switch $0 {
            case .failure(_):
                print("kaput :c")
            case let .success(tvData):
                let date = tvData.firstAirDate?.split(separator: "-")
                DispatchQueue.main.async {
                    
                    self.nameLbl.text = tvData.networks.first?.name ?? ""
                    self.yearLbl.text = String(date?[0] ?? "")
                    self.RLbl.text = tvData.genres.first?.name ?? "R"
                    self.setImage(imageView: self.coverImg, url: URL(string: ApiRoutes.imageBaseUrl+(tvData.posterPath ?? "/s22fRhj8xFPbiexrJwiAOcDEIrS.png"))!)
                    
                }
//             ApiClient.shared.getSesoneDetail(endPoint:endpoint ) {
//                switch $0 {
//                case .failure(_):
//                    print("kaput :c")
//                case let .success(sesone):
//                        print(sesone.episodes)
//                }
//                 print(Tv.spokenLanguages.first?.iso6391 ?? "")
//            }
        }


    }
        

    }
    
    //MARK: - Functions
    
    
    
    //MARK: - IBAction
    
    
    @IBAction func playAction(_ sender: Any) {
        let vc = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func trailerAction(_ sender: Any) {
        
    }
    @IBAction func watchListAction(_ sender: Any) {
        
    }
    @IBAction func likeAction(_ sender: Any) {
        
    }
    @IBAction func dontLikeAction(_ sender: Any) {
        
    }
}
