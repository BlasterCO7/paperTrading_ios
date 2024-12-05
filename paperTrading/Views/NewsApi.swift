//import Foundation
//
//// Structs to decode the API response
//struct NewsItem: Decodable {
//    let source: String
//    let snippet: String
//}
//
//struct ApiResponse: Decodable {
//    let data: [NewsData]
//    let meta: Meta
//}
//
//struct NewsData: Decodable {
//    let source: String
//    let snippet: String
//}
//
//struct Meta: Decodable {
//    let found: Int
//    let returned: Int
//    let limit: Int
//    let page: Int
//}
//
//// Function to fetch news data
//func fetchNews(apiToken: String, completion: @escaping ([NewsItem]) -> Void) {
//    let baseUrl = "https://api.marketaux.com/v1/news/all"
//    let limit = 10
//    var allNews: [NewsItem] = []
//    let group = DispatchGroup()
//    
//    for page in 1...2 { // Loop to fetch top 20 (2 pages of 10)
//        group.enter()
//        let url = URL(string: "\(baseUrl)?countries=us&filter_entities=true&limit=\(limit)&page=\(page)&api_token=\(apiToken)")!
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            defer { group.leave() }
//            
//            guard let data = data, error == nil else {
//                print("Error fetching data: \(String(describing: error))")
//                return
//            }
//            
//            do {
//                let apiResponse = try JSONDecoder().decode(ApiResponse.self, from: data)
//                let news = apiResponse.data.map { NewsItem(source: $0.source, snippet: $0.snippet) }
//                allNews.append(contentsOf: news)
//            } catch {
//                print("Error decoding response: \(error)")
//            }
//        }
//        task.resume()
//    }
//    
//    group.notify(queue: .main) {
//        completion(allNews)
//    }
//}
//
//// Function to call and print the fetched news
//func getAndPrintNews() {
//    let apiToken = "your_api_key"
//    fetchNews(apiToken: apiToken) { news in
//        print("Fetched News:")
//        for item in news {
//            print("Source: \(item.source)\nSnippet: \(item.snippet)\n")
//        }
//    }
//}
//
