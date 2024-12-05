//import Foundation
//
//struct StockData: Decodable {
//    let date: String
//    let open: Double
//}
//
//class StockAPIService {
//    private let apiKey = "MNKW0OL7W5DW15TJ" // Your API Key
//    private let baseUrl = "https://www.alphavantage.co/query"
//
//    func fetchStockData(symbol: String, interval: String, completion: @escaping ([StockData]) -> Void) {
//        // Build the URL based on the provided symbol and interval
//        guard let url = URL(string: "\(baseUrl)?function=\(interval)&symbol=\(symbol)&apikey=\(apiKey)") else {
//            completion([])
//            return
//        }
//
//        // Fetch data from API
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                // Print the raw response data
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("Raw API Response: \(jsonString)")  // This is the serialized data
//                }
//
//                do {
//                    let decoder = JSONDecoder()
//                    // Decode the response based on the interval
//                    let apiResponse = try decoder.decode(StockAPIResponse.self, from: data, interval: interval)
//                    
//                    // Process and return the stock data (date, open price)
//                    let dataPoints = apiResponse.timeSeries.compactMap { (key, value) -> StockData? in
//                        guard let openPrice = Double(value.open) else { return nil }
//                        return StockData(date: key, open: openPrice)
//                    }
//                    
//                    let sortedData = dataPoints.sorted { $0.date < $1.date }
//                    completion(sortedData)
//                } catch {
//                    print("Error decoding data: \(error.localizedDescription)")
//                    completion([])
//                }
//            } else {
//                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
//                completion([])
//            }
//        }.resume()
//    }
//}
//
//struct StockAPIResponse: Decodable {
//    let timeSeries: [String: StockDataPoint]
//
//    struct StockDataPoint: Decodable {
//        let open: String
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case timeSeries
//        // Optionally handle dynamic key based on the interval
//        init(stringValue: String) {
//            switch stringValue {
//            case "Time Series (Daily)":
//                self = .timeSeries
//            case "Time Series (Weekly)":
//                self = .timeSeries
//            case "Time Series (Monthly)":
//                self = .timeSeries
//            default:
//                self = .timeSeries
//            }
//        }
//    }
//
//    init(from decoder: Decoder, interval: String) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let timeSeriesKey = CodingKeys(stringValue: interval)
//        self.timeSeries = try container.decode([String: StockDataPoint].self, forKey: timeSeriesKey)
//    }
//}
