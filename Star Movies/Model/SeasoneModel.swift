//
//  SeasoneModel.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import Foundation

// MARK: - Welcome
struct SeasoneDetailModel: Codable {
    let airDate: String?
    let episodes: [Episode]?
    let name, overview: String?
    let id: Int?
    let seasonNumber: Int?
    
}

// MARK: - Episode
struct Episode: Codable {
    let airDate: String?
    let episodeNumber, id: Int?
    let name, overview, productionCode: String?
    let seasonNumber, showId: Int?
    let voteAverage, voteCount: Int?
}

