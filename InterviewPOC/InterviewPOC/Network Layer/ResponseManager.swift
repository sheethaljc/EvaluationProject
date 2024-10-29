//
//  ResponseManager.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

protocol ResponseDelegate {
    func parseData<T : Codable>(_ data: Data, type: T.Type) throws -> T
}

struct ResponseManager: ResponseDelegate {
    func parseData<T : Codable>(_ data: Data, type: T.Type) throws -> T {
        let model =  try JSONDecoder().decode(type.self, from: data)
        return model
    }
}
