//
//  APIManager.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

protocol APIDelegate {
    func fetchData(_ url: URL) async throws -> Data
}

struct APIManager: APIDelegate {
    func fetchData(_ url: URL) async throws -> Data  {

        let urlRequest = URLRequest(url: url)
        let (data , _) = try await URLSession.shared.data(for: urlRequest)
        try Utility.dataToStringForLog(data)
        if data.isEmpty {
            throw NetworkErrors.emptyData
        }
        return data
    }
    
}
