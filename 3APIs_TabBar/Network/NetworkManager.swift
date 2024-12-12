//
//  Untitled.swift
//  3APIs_TabBar
//
//  Created by Anusha Raju on 12/11/24.
//

import Foundation

enum DataError: Error {
    case invalidURL
    case invalidData
}

class NetworkManager {
    static let sharedInstance = NetworkManager()
    private init() { }
    
    //MARK: - Get data from the URL
    func fetchData<T: Decodable>(from url: String) async throws -> T {
        guard let serverUrl =  URL(string: url) else {
            print("getData: Invalid URL")
            throw DataError.invalidURL
        }
        
        let(data, response) = try await URLSession.shared.data(from: serverUrl)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("getData: Invalid response")
            throw DataError.invalidData
        }
        
        let dataResponse = try JSONDecoder().decode(T.self, from: data)
//        print(dataResponse)
        return dataResponse
    }
}

