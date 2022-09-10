//
//  Network.swift
//  Star Movies
//
//  Created by HaiDer's Macbook Pro on 10/09/2022.
//

import Foundation

//MARK: - Protocol

protocol StarMovie {
    func getTvDetail(completion:@escaping(Result<TvDetailModel,APIError>)->Void)
    func getSesoneDetail(completion:@escaping(Result<TvDetailModel,APIError>)->Void)
    func getEpisodeDetail(completion:@escaping(Result<TvDetailModel,APIError>)->Void)
}

//MARK: - Enum
enum APIError: Error {
    case internalError
    case serverError
    case parsingError
}


//MARK: - Network Routes

struct ApiRoutes {
    
    static let baseUrl = "https://api.themoviedb.org/3/tv/"
    static let imageBaseUrl = "https://image.tmdb.org/t/p/w500"
    static let apiKeyWithParams = "?api_key=ecef14eac236a5d4ec6ac3a4a4761e8f&language=en-US"
    static let sampleVideo = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4"
}


//MARK: - Network Class
class ApiClient {
    
    //MARK: - Statics
    
    class var shared : ApiClient {
        struct Static {
            static let instance : ApiClient = ApiClient()
        }
        return Static.instance
    }
    
    
    //MARK: - Variables

    private enum Method:String {
        case GET
        case POST
    }
    
    //MARK: - Api Functions
    
    func getTvDetail(endPoint:String,completion: @escaping (Result<TvDetailModel, APIError>) -> Void) {
        request(endpoint: endPoint, method: .GET, completion: completion)
    }
    
    func getSesoneDetail(endPoint:String,completion: @escaping (Result<SeasoneDetailModel, APIError>) -> Void) {
        request(endpoint: endPoint, method: .GET, completion: completion)
    }
    
    func getEpisodeDetail(endPoint:String,completion: @escaping (Result<EpisodeDetails, APIError>) -> Void) {
        request(endpoint: endPoint, method: .GET, completion: completion)
    }
    
    
    //MARK: - Private Request
    
    
    private func request<T: Codable>(endpoint: String, method: Method,
                                  completion: @escaping((Result<T, APIError>) -> Void)) {
        let path = "\(ApiRoutes.baseUrl)\(endpoint)\(ApiRoutes.apiKeyWithParams)"
        guard let url = URL(string: path)
        else { completion(.failure(.internalError)); return }
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        call(with: request, completion: completion)
    }
    
    
    //MARK: - Generic
    
    
    private func call<T: Codable> (with request: URLRequest,completion: @escaping( (Result<T, APIError>) -> Void)) {
        print(T.self)
        Utility.showLoading()
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            Utility.hideLoading()
            guard error == nil
            else { completion(.failure(.serverError)); return }
            do {
                guard let data = data else { completion(.failure(.serverError)); return }
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let object = try decoder.decode(T.self, from: data)
                print(request.url?.absoluteString ?? "")
                print("/////////////////////////////////////////////////")
                print("👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏👏")
                print("/////////////////////////////////////////////////")
                print(object)
                completion(Result.success(object))
            } catch {
                print(request.url?.absoluteString ?? "")
                print("/////////////////////////////////////////////////")
                print("🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲🥲")
                print("/////////////////////////////////////////////////")
                completion(Result.failure(.parsingError))
            }}
        dataTask.resume()
        
    }
    
    
}
