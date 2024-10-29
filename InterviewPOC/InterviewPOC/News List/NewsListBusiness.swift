//
//  NewsListBusiness.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

protocol BusinessDelegate {
    var networkDelegate: NetworkDelegate { get }
    func fetchNews() async throws -> [NewsList.Results]?
}

struct NewsListBusiness: BusinessDelegate {
    var networkDelegate: NetworkDelegate
    
    init(networkDelegate: NetworkDelegate = NetworkManager()) {
        self.networkDelegate = networkDelegate
    }

    func fetchNews() async throws -> [NewsList.Results]? {
        let model = try await networkDelegate.fetchData(.news, type: NewsList.Model.self)
        let results = model.results
        return Utility.sortByDates(results)
    }

}
