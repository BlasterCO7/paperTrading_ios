import SwiftUI

struct NewsArticle: Identifiable {
    var id: String { uuid }
    let uuid: String
    let title: String
    let snippet: String
    let source: String
    let url: String
}

class NewsViewModel: ObservableObject {
    @Published var newsArticles: [NewsArticle] = []
    
    func fetchNews() {
        let urlString = "https://api.marketaux.com/v1/news/all?countries=us&filter_entities=true&limit=20&published_after=2024-11-23T11:38&api_token=UCtDA3oJuOqsfgHGrfl7p5WpjJMzwj6AAdpjoZoW"
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(NewsAPIResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.newsArticles = response.data.map { article in
                            NewsArticle(uuid: article.uuid,
                                        title: article.title,
                                        snippet: article.snippet,
                                        source: article.source,
                                        url: article.url)
                        }
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }
        task.resume()
    }
}

struct NewsAPIResponse: Codable {
    let data: [NewsArticleData]
}

struct NewsArticleData: Codable {
    let uuid: String
    let title: String
    let snippet: String
    let source: String
    let url: String
}

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.newsArticles) { article in
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.headline)
                    Text(article.snippet)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("Source: \(article.source)")
                        .font(.footnote)
                        .foregroundColor(.blue)
                    Link("Read more", destination: URL(string: article.url)!)
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
                .padding()
            }
            .navigationTitle("Top News")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    NewsListView()
}
