//
//  ArticleSummarizerView.swift
//  ArticleSummarizer
//
//  Created by Daulet Ashikbayev on 08.04.2023.
//

import SwiftUI

struct ArticleSummarizerView: View {
    
    @State private var urlInput = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(alignment: .leading, spacing: 16) {
                    List(viewModel.articles, id: \.url) { article in
                        NavigationLink(destination: SummaryView(article: article)) {
                            VStack(alignment: .leading, spacing: 8) {
                                
                                HStack {
                                    Image(systemName: "doc.plaintext")
                                        .font(.system(size: 18, weight: .regular))
                                        .foregroundColor(.gray)
                                    Text(article.title)
                                        .font(.system(size: 18, weight: .medium))
                                }
                                HStack {
                                    Image(systemName: "person.circle")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.gray)
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
                                HStack {
                                    Image(systemName: "link")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.gray)
                                    Text(article.url)
                                        .font(.system(size: 14, weight: .light))
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .listStyle(.plain)
                    HStack {
                        Spacer()
                        Button {
                            showAlert = true
                        } label: {
                            Label("Add an article", systemImage: "plus.circle.fill").labelStyle(.iconOnly)
                                .font(.system(size: 50, weight: .regular))
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.black)
                                .clipShape(Circle())
                                .shadow(radius: 3, x: 0, y: 5)
                        }
                        Spacer()
                    }
                }
                .padding()
                .navigationBarTitleDisplayMode(.inline)
                //                ToolbarItem(placement: .navigationBarTrailing) {
                //                    Button(action: {
                //                        // Implement action for the button here
                //                    }) {
                //                        Image(systemName: "gearshape")
                //                            .font(.system(size: 20, weight: .regular))
                //                            .foregroundColor(.blue)
                //                    }
                //                }
                
                .alert("Add an Article", isPresented: $showAlert) {
                    TextField("Enter URL", text: $urlInput)
                        .textInputAutocapitalization(.never)
                    Button("OK") {
                        viewModel.getArticle(urlInput: urlInput)
                        showAlert = false
                    }
                    Button("Cancel", role: .cancel) { showAlert = false }
                } message: {
                    Text("Enter the URL of the article you want to summarize")
                }
                
                if viewModel.isLoading {
                    CustomLoadingIndicator()
                }
            }
            .navigationTitle("Takeaways from Articles ✍️")
            .navigationBarTitleDisplayMode(.large)
        
            
        }
        .onAppear() {
            viewModel.loadSavedArticles()
        }
    }
}


struct ArticleSummarizerView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleSummarizerView()
    }
}
