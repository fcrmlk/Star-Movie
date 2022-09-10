//
//  HomeExtention.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 11/09/2022.
//

import Foundation


//MARK: - Api Functions


extension HomeViewController {
    func fetchTvDataApi() {
        ApiClient.shared.getTvDetail(endPoint: "\(tvID)") {
            switch $0 {
            case .failure(_):break
            case let .success(tvData):
                self.fetchedTvData = tvData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                self.setupHomePage(tvData: tvData)
            }
            
            
        }
    }
    
    func fetchSesonedataApi(index:Int) {
        ApiClient.shared.getSesoneDetail(endPoint: "\(tvID)/season/\(index)") {
            switch $0 {
            case .failure(_):break
            case let .success(sesone):
                self.sesoneData = sesone
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

}
