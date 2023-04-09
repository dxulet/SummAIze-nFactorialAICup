//
//  Article.swift
//  ArticleSummarizer
//
//  Created by Daulet Ashikbayev on 08.04.2023.
//

import Foundation

struct Article: Codable {
    let title: String
    let authors: [String]
    let url: String
    let takeaways: [String]
}

class ArticleManager {
    
    static let shared = ArticleManager()
    
    private let userDefaults = UserDefaults.standard
    
    func save(articles: [Article]) {
        // Retrieve existing articles from UserDefaults
        var existingArticles = load() ?? []
        // Append new articles to existing array
        existingArticles.insert(contentsOf: articles, at: 0)
        // Encode articles array to Data
        if let encodedData = try? JSONEncoder().encode(existingArticles) {
            // Save encoded data to UserDefaults
            userDefaults.set(encodedData, forKey: "articles")
        }
    }
    
    func load() -> [Article]? {
        if let encodedData = userDefaults.data(forKey: "articles") {
            // Decode Data back to [Article] array
            return try? JSONDecoder().decode([Article].self, from: encodedData)
        }
        return nil
    }
    
}
