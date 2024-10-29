//
//  NewsList.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

struct NewsList {
    struct Model: Codable {
        let status : String?
        let totalResults : Int?
        let results : [Results]?
        let nextPage : String?
        
        enum CodingKeys: String, CodingKey {
            case status = "status"
            case totalResults = "totalResults"
            case results = "results"
            case nextPage = "nextPage"
        }
        
    }
    
    struct Results : Codable {
        let article_id : String?
        let title : String?
        let link : String?
        let description : String?
        let pubDate : String?
        
        
        enum CodingKeys: String, CodingKey {
            case article_id = "article_id"
            case title = "title"
            case link = "link"
            case description = "description"
            case pubDate = "pubDate"
        }
        
    }
}


