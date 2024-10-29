//
//  NewsListInteracter.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

protocol InteracterDelegate {
    var businessDelegate: BusinessDelegate { get}
    
    func fetchNews() async throws
}

class NewsListInteracter: InteracterDelegate {
    var businessDelegate: BusinessDelegate
    var results : [NewsList.Results]?
    
    init(businessDelegate: BusinessDelegate = NewsListBusiness()) {
        self.businessDelegate = businessDelegate
    }

    func fetchNews() async throws {
        results = try await businessDelegate.fetchNews()
    }
}

