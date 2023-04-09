//
//  ViewModel.swift
//  ArticleSummarizer
//
//  Created by Daulet Ashikbayev on 09.04.2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var articles = [Article]()
    @Published var alertTitle = ""
    @Published var showAlert = false
    @Published var isLoading = false
    
    func getArticle(urlInput: String) {
        isLoading = true
        let api: String = "http://127.0.0.1:5000/article?url="
        guard let url = URL(string: api + urlInput) else {
            // Show error message if URL is invalid
            alertTitle = "Invalid URL"
            showAlert = true
            return
        }
        
        // Make GET request to backend server
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                self.alertTitle = error.localizedDescription
                self.showAlert = true
                self.isLoading = false
                return
            }
            if let data = data {
                // Decode JSON data
                let decoder = JSONDecoder()
                do {
                    let articles = try decoder.decode(Article.self, from: data)
                    ArticleManager.shared.save(articles: [articles])
                    DispatchQueue.main.async {
                        self.articles = self.loadSavedArticles()
                        self.isLoading = false
                    }
                } catch {
                    self.alertTitle = error.localizedDescription
                    self.showAlert = true
                    self.isLoading = false
                }
            }
        }
        task.resume()
    }
    
    func loadSavedArticles() -> [Article] {
        if let savedArticles = ArticleManager.shared.load() {
            self.articles = savedArticles
        }
        return articles
    }
}
