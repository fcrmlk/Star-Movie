//
//  TVDetailModel.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import Foundation

// MARK: - Welcome

struct TvDetailModel: Codable {
    let adult: Bool?
    let createdBy: [CreatedBy]?
    let episodeRunTime: [Int]?
    let firstAirDate: String?
    let genres: [Genre]
    let homepage: String?
    let id: Int?
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let lastEpisodeToAir: LastEpisodeToAir
    let name: String?
    let networks: [Network]
    let numberOfEpisodes, numberOfSeasons: Int?
    let originCountry: [String]
    let originalLanguage, originalName, overview: String?
    let popularity: Double?
    let seasons: [Season]
    let spokenLanguages: [SpokenLanguage]
    let status : String?
    let tagline:String?
    let type: String?
    let voteAverage: Double?
    let voteCount: Int?
    let posterPath: String?
    
}

// MARK: - CreatedBy
struct CreatedBy: Codable {
    let id: Int?
    let creditId :String?
    let name: String?
    let gender: Int?
    let profilePath: String?
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

// MARK: - LastEpisodeToAir
struct LastEpisodeToAir: Codable {
    let airDate: String?
    let episodeNumber, id: Int?
    let name, overview, productionCode: String?
    let seasonNumber, showId: Int?
    let voteAverage, voteCount: Int?
}

// MARK: - Network
struct Network: Codable {
    let id: Int?
    let name, logoPath, originCountry: String?
}

// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let episodeCount, id: Int?
    let name, overview: String?
    let seasonNumber: Int?
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso6391, name: String?
}

