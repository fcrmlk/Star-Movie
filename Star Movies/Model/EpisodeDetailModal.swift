//
//  EpisodeDetailModal.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import Foundation
struct EpisodeDetails: Codable {
    let airDate: String?
    let episodeNumber: Int?
    let name, overview: String?
    let id: Int?
    let productionCode: String?
    let seasonNumber: Int?
    let voteAverage, voteCount: Double?
}
