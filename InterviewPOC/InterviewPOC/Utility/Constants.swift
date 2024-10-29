//
//  Constants.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 29/10/24.
//

enum StoryBoard {
    static let main = "Main"
}


enum NetworkErrors: Error {
    case emptyData
    case invalidUrl
}

enum ApiUrl: String {
    case news = "https://newsdata.io/api/1/news?apikey=pub_57551de5f96068daa16c9b49babcfa4e49d7f&language=en"
}
