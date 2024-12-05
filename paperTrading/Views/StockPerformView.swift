//import SwiftUI
//import SwiftUICharts
//
//// Enum for Time Periods
////enum Timeline: String {
////    case oneDay = "TIME_SERIES_INTRADAY"
////    case oneWeek = "TIME_SERIES_WEEKLY"
////    case oneMonth = "TIME_SERIES_MONTHLY"
////}
//
//struct StockPerformView: View {
//    @Binding var searchText: String
//    @State private var stockData: [StockData] = []
//    @State private var selectedTimeline: Timeline = .oneDay
//    @State private var isLoading: Bool = false
//    
//    var body: some View {
//        VStack {
//            // Timeline Selector
//            HStack {
//                TimelineButton(timeline: .oneDay, selectedTimeline: $selectedTimeline) {
//                    fetchStockData(for: searchText, timeline: $0)
//                }
//                TimelineButton(timeline: .oneWeek, selectedTimeline: $selectedTimeline) {
//                    fetchStockData(for: searchText, timeline: $0)
//                }
//                TimelineButton(timeline: .oneMonth, selectedTimeline: $selectedTimeline) {
//                    fetchStockData(for: searchText, timeline: $0)
//                }
//            }
//            .padding()
//            
//            // Show loading indicator while fetching data
//            if isLoading {
//                ProgressView("Loading data...")
//                    .padding()
//            } else if !stockData.isEmpty {
//                // Line Chart for Stock Data
//                LineChart(chartData: chartData())
//                    .touchOverlay(chartData: chartData())
//                    .xAxisGrid(chartData: chartData())
//                    .yAxisGrid(chartData: chartData())
//                    .yAxisLabels(chartData: chartData())
//                    .padding()
//            } else {
//                Text("No data available. Use the search bar to find a stock.")
//                    .foregroundColor(.gray)
//                    .padding()
//            }
//        }
//        .onAppear {
//            if !searchText.isEmpty {
//                fetchStockData(for: searchText, timeline: selectedTimeline)
//            }
//        }
//        .onChange(of: searchText) { _ in
//            if !searchText.isEmpty {
//                fetchStockData(for: searchText, timeline: selectedTimeline)
//            }
//        }
//    }
//
//    // Fetch Stock Data using API
//    private func fetchStockData(for symbol: String, timeline: Timeline) {
//        isLoading = true
//        
//        let interval: String
//        switch timeline {
//        case .oneDay: interval = "1min"
//        case .oneWeek: interval = "15min"
//        case .oneMonth: interval = "1hour"
//        }
//        
//        StockAPIService().fetchStockData(symbol: symbol, interval: interval) { fetchedData in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                self.stockData = fetchedData
//            }
//        }
//    }
//
//    // Prepare data for LineChart
//    private func chartData() -> LineChartData {
//        let dataPoints = stockData.enumerated().map { index, stock in
//            LineChartDataPoint(value: stock.open, xAxisLabel: "\(index)", description: stock.date)
//        }
//        
//        return LineChartData(
//            dataSets: LineDataSet(
//                dataPoints: dataPoints,
//                legendTitle: "Price",
//                style: LineStyle(lineColour: ColourStyle(colour: .blue), lineType: .curvedLine)
//            )
//        )
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
//        case timeSeries = "Time Series (1min)" // Adjust this dynamically based on the interval
//    }
//
//    init(from decoder: Decoder, interval: String) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        // Dynamically decode based on the interval
//        let timeSeriesKey = CodingKeys(stringValue: interval)
//        self.timeSeries = try container.decode([String: StockDataPoint].self, forKey: timeSeriesKey)
//    }
//}
//
//// StockAPIService
//class StockAPIService {
//    private let apiKey = "MNKW0OL7W5DW15TJ" // Your API Key
//    private let baseUrl = "https://www.alphavantage.co/query"
//
//    func fetchStockData(symbol: String, interval: String, completion: @escaping ([StockData]) -> Void) {
//        guard let url = URL(string: "\(baseUrl)?function=\(interval)&symbol=\(symbol)&apikey=\(apiKey)") else {
//            completion([])
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                // Print the raw response data
//                if let jsonString = String(data: data, encoding: .utf8) {
//                    print("Raw API Response: \(jsonString)")  // This is the serialized data
//                }
//
//                do {
//                    let decoder = JSONDecoder()
//                    let apiResponse = try decoder.decode(StockAPIResponse.self, from: data, interval: interval)
//                    
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
//struct StockData: Decodable {
//    let date: String
//    let open: Double
//}
//
//#Preview {
//    StockPerformView(searchText: .constant("AAPL"))
//}
