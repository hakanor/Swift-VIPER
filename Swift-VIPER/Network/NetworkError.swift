//
//  NetworkError.swift
//  Swift-VIPER
//
//  Created by Hakan Or on 17.05.2024.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case failedRequest(error: String)
    case invalidResponse
    case decodingError
}
