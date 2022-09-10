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
    @IBOutlet weak var searchBar: UISearchBar!
    
    //MARK: - Variables
    
    
    var fetchedTvData : TvDetailModel?
    var sesoneData : SeasoneDetailModel?
    var selectedIndex = -1
    var tvID = 20
    var rawPoster = "/s22fRhj8xFPbiexrJwiAOcDEIrS.png"
    
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchTvDataApi()
    }
    
    //MARK: - Functions
    
    func setupHomePage(tvData:TvDetailModel) {
        let date = tvData.firstAirDate?.split(separator: "-")
        DispatchQueue.main.async {
            self.nameLbl.text = tvData.networks.first?.name ?? ""
            self.yearLbl.text = String(date?[0] ?? "")
            self.RLbl.text = tvData.genres.first?.name ?? "R"
            self.setImage(imageView: self.coverImg, url: URL(string: ApiRoutes.imageBaseUrl+(tvData.posterPath ?? self.rawPoster))!)
        }
    }
    
    
    //MARK: - IBAction
    
    @IBAction func searchAction(_ sender: Any) {
        if Int(searchBar.text ?? "abc") != nil {
            self.fetchTvDataApi()
        }
        else {
            Utility.showErrorMessage(message: "Please enter in Digits")
        }
    }
    
    @IBAction func playAction(_ sender: Any) {
        let vc = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func trailerAction(_ sender: Any) {
        self.showToast(message: "Trailer not Found", .info, "Not Found")
    }
    
    @IBAction func watchListAction(_ sender: Any) {
        self.showToast(message: "Added to Wishlist", .success, "Success")
    }
    
    @IBAction func likeAction(_ sender: UIButton) {
        self.showToast(message: "Liked", .success, "Success")
    }
    
    @IBAction func dontLikeAction(_ sender: Any) {
        self.showToast(message: "Dislike", .error, "Success")
    }
}


extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sesoneData?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(EpisodesTableViewCell.self, indexPath: indexPath)
        cell.config(data: self.sesoneData,index:indexPath.row, image: self.fetchedTvData?.posterPath ?? rawPoster)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.fetchedTvData?.seasons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.register(TitleCollectionViewCell.self, indexPath: indexPath)
        if selectedIndex == indexPath.item {
            cell.bottomLine.backgroundColor = .white
            cell.nameLbl.textColor = .white
        }
        else {
            cell.nameLbl.textColor = .darkGray
            cell.bottomLine.backgroundColor = .clear
            
        }
        if indexPath.item == self.fetchedTvData?.seasons.count ?? 0 {
            cell.lastLine.isHidden = true
        }
        else {
            cell.lastLine.isHidden = false
        }
        cell.config(title: self.fetchedTvData?.seasons[indexPath.item].name ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width/3), height: self.collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        self.fetchSesonedataApi(index: indexPath.item)
        self.selectedIndex = indexPath.item
        self.collectionView.reloadData()
        
    }
}

