//
//  NetworkService.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import Foundation

protocol NetworkProvidable {
    func fetch(urlString: String, httpMethod: HTTPMethod) async throws -> Data
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

final class NetworkProvider: NetworkProvidable {
    
    var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetch(urlString: String, httpMethod: HTTPMethod) async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        do {
            
            let (data, response) = try await urlSession.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            
            return data
        } catch {
            throw NetworkError.failedRequest(error: error.localizedDescription)
        }
    }
    
    func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(type, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
