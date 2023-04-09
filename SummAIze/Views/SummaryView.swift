//
//  SummaryView.swift
//  ArticleSummarizer
//
//  Created by Daulet Ashikbayev on 08.04.2023.
//

import SwiftUI

struct SummaryView: View {
    let article: Article
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                HStack {
                    Image(systemName: "person.circle")
                        .font(.system(size: 14))
                    if article.authors.joined().isEmpty {
                        Text("who am i")
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.gray)
                    } else {
                        Text(article.authors.joined(separator: ", "))
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.gray)
                    }
                }
                Link(destination: URL(string: article.url)!) {
                    HStack {
                        Image(systemName: "link")
                            .font(.system(size: 14))
                        Text(article.url)
                            .font(.system(size: 14, weight: .light))
                            .foregroundColor(.blue)
                            .underline()
                            .lineLimit(1)
                    
                    }
                }
                Divider()
                Text("Top 10 Key Moments")
                    .font(.system(size: 24, weight: .bold))
                Text(article.takeaways.joined(separator: "\n"))
                    .font(.system(size: 16, weight: .regular))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(8)
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(16)
            .shadow(color: Color(.systemGray3), radius: 10, x: 0, y: 5)
        .padding(.horizontal, 16)
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(article: ArticlesMock.articles[0])
    }
}
