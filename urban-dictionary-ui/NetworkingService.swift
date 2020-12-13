//
//  NetworkingService.swift
//  urban-dictionary-ui
//
//  Created by LeeChan on 12/6/20.
//

import Foundation

final class NetworkingService {
    func define(_ searchTerm: String, completion: @escaping (Result<[Term], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "mashape-community-urban-dictionary.p.rapidapi.com"
        urlComponents.path = "/define"
        urlComponents.queryItems = [
            URLQueryItem(name: "term", value: searchTerm)
        ]
        
//        print(urlComponents.string)
        
        guard let url = urlComponents.url else {
            completion(.failure(NetworkingError.badUrl))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("mashape-community-urban-dictionary.p.rapidapi.com", forHTTPHeaderField: "x-rapidapi-host")
        request.addValue("aa6d0b0f9fmsha9f510b53c21374p1dd5bfjsnd4d52623aa0b", forHTTPHeaderField: "x-rapidapi-key")
        
        URLSession.shared.dataTask(with: request) {
            if let error = $2 {
                completion(.failure(error))
            } else if let data = $0 {
                do {
                    let response = try JSONDecoder().decode(
                        DefineSearchTermResponse.self,
                        from: data
                    )
                    DispatchQueue.main.async {
                        completion(.success(response.list))
                    }
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

enum NetworkingError: Error {
    case badUrl
}
