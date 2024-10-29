//
//  NetworkManager.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

protocol NetworkDelegate {
    var apiDelegate: APIDelegate { get }
    var responseDelegate: ResponseDelegate { get }

    func fetchData<T : Codable>(_ urlType: ApiUrl?, type: T.Type) async throws -> T
}

struct NetworkManager: NetworkDelegate {
    var apiDelegate: APIDelegate = APIManager()
    var responseDelegate: ResponseDelegate = ResponseManager()
    
   
     func fetchData<T : Codable>(_ urlType: ApiUrl?, type: T.Type) async throws -> T {
        guard let urlType, let url  = URL(string: urlType.rawValue) else {
            throw NetworkErrors.invalidUrl
        }
        
        let data = try await apiDelegate.fetchData(url)
        let model =  try responseDelegate.parseData(data, type: type)

        return model
    }
}
