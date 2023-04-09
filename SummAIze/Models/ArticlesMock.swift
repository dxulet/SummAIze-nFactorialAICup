//
//  ArticlesMock.swift
//  ArticleSummarizer
//
//  Created by Daulet Ashikbayev on 08.04.2023.
//

import Foundation

struct ArticlesMock {
    static let articles = [
        Article(
            title: "The 10 Best Things to Do in New York City",
            authors: ["Katie Nageotte"],
            url: "https://www.tripsavvy.com/best-things-to-do-in-new-york-city-4158462",
            takeaways: ["1. Visit the Empire State Building.", "2. Take a stroll through Central Park.", "3. See a Broadway show.", "4. Take a ferry to the Statue of Liberty.", "5. Visit the Metropolitan Museum of Art.", "6. Take a walk through Greenwich Village.", "7. Visit the 9/11 Memorial.", "8. Take a ride on the Staten Island Ferry.", "9. See the Rockefeller Center.", "10. Visit the Museum of Modern Art."]
        ),
        Article(
            title: "Mock Article",
            authors: ["John Doe"],
            url: "https://www.mock.com",
            takeaways: ["1. Mock Article.", "2. Mock Article.", "3. Mock Article.", "4. Mock Article.", "5. Mock Article.", "6. Mock Article.", "7. Mock Article.", "8. Mock Article.", "9. Mock Article.", "10. Mock Article."]
        )
    ]
}
