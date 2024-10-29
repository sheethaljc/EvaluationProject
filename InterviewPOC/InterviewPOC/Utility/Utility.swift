//
//  Utility.swift
//  InterviewPOC
//
//  Created by sheethal.chalissery on 28/10/24.
//

import Foundation

struct Utility {
    static func sortByDates(_ arr: [NewsList.Results]?) -> [NewsList.Results]? {
        guard let arr, arr.count > 1 else {
            return arr
        }
        return sorting(arr)
    }
    
    
   private static func sorting(_ a: [NewsList.Results]) -> [NewsList.Results] {
        
        var sortArray: [NewsList.Results] = a
        for i in 1..<sortArray.count {
            let val = sortArray[i]
            var j = i - 1
            
            while (j >= 0  && isDateGreaterthan(sortArray[j], val)) {
                sortArray[j + 1] = sortArray[j]
                j = j - 1
            }
            
            sortArray[j + 1] = val
            
        }
            
        return sortArray
    }
    
    private static func isDateGreaterthan (_ aResult: NewsList.Results, _ bResult: NewsList.Results) -> Bool {
        
        guard let leftFirstValue = aResult.pubDate, let rightFirstValue = bResult.pubDate else {
            return false
        }
        
        let df = pubDateFormatter()
        
        guard let leftFirstDate = df.date(from: leftFirstValue), let rightFirstDate = df.date(from: rightFirstValue) else {
            return false
        }
        if leftFirstDate < rightFirstDate {
            return true
        } else {
            return false
        }
    }
    
    static func displayDate(_ pubDateStr: String?) -> String {
        if let pubDateStr, !pubDateStr.isEmpty {
            let df = pubDateFormatter()
            if let pubDate = df.date(from: pubDateStr) {
                let displayDate = displayDateFormatter()
                let str = displayDate.string(from: pubDate)
                return str
            }
        }
        return ""
        
    }
    
    
    fileprivate static func pubDateFormatter() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-M-d HH:mm:ss"
        return df
    }
    
    fileprivate static func displayDateFormatter() -> DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "MMM d, h:mm a"
        return df
    }
    
    static func dataToStringForLog(_ data: Data) throws {
        // printing for verify only
        let object = try JSONSerialization.jsonObject(with: data)
        let prettyPrintedData = try JSONSerialization.data(
            withJSONObject: object,
            options: [.prettyPrinted, .sortedKeys]
        )
        
        let prettyPrintedString = String(data: prettyPrintedData, encoding: .utf8)!
        print(prettyPrintedString)
    }
}
