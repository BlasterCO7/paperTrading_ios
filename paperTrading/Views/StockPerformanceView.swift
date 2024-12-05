//import SwiftUI
//import SwiftUICharts
//
//
//struct StockPerformanceView: View {
//    @Binding var searchText: String
//    @State private var stockData: [StockData] = []
//    @State private var selectedTimeline: Timeline = .oneDay
//    let apiKey="MNKW0OL7W5DW15TJ"
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
//            // Stock Performance Line Chart
//            if !stockData.isEmpty {
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
//    // Function to fetch mock stock data
//    private func fetchStockData(for symbol: String, timeline: Timeline) {
//        // Example mock data
//        stockData = (0..<50).map { i in
//            StockData(date: "2024-11-\(i + 1)", price: Double.random(in: 120...200))
//        }
//    }
//
//    // Prepare data for LineChart
//    private func chartData() -> LineChartData {
//        let dataPoints = stockData.enumerated().map { index, stock in
//            LineChartDataPoint(value: stock.price, xAxisLabel: "\(index)", description: stock.date)
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
//// Timeline Selector Button
//struct TimelineButton: View {
//    let timeline: Timeline
//    @Binding var selectedTimeline: Timeline
//    var onSelect: (Timeline) -> Void
//
//    var body: some View {
//        Button(action: {
//            selectedTimeline = timeline
//            onSelect(timeline)
//        }) {
//            Text(timelineTitle)
//                .padding()
//                .background(selectedTimeline == timeline ? Color.blue : Color.gray.opacity(0.2))
//                .foregroundColor(.white)
//                .cornerRadius(8)
//        }
//    }
//
//    private var timelineTitle: String {
//        switch timeline {
//        case .oneDay: return "1 Day"
//        case .oneWeek: return "1 Week"
//        case .oneMonth: return "1 Month"
//        }
//    }
//}
//
//// Enum for timeline types
//enum Timeline {
//    case oneDay
//    case oneWeek
//    case oneMonth
//}
//
//// Data structure for stock data
//struct StockData {
//    let date: String
//    let price: Double
//}
//
//#Preview {
//    StockPerformanceView(searchText: .constant("AAPL"))
//}
//
//
//func fetchStockDataFromAPI(symbol: String, interval: String, completion: @escaping ([StockData]?) -> Void) {
//    let apiKey = "YOUR_ALPHA_VANTAGE_API_KEY"
//    let urlString = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol=\(symbol)&interval=\(interval)&apikey=\(apiKey)"
//    
//    guard let url = URL(string: urlString) else {
//        completion(nil)
//        return
//    }
//    
//    URLSession.shared.dataTask(with: url) { data, response, error in
//        if let data = data {
//            let stockData = parseStockData(data)
//            completion(stockData)
//        } else {
//            completion(nil)
//        }
//    }.resume()
//}
//
//func parseStockData(_ data: Data) -> [StockData]? {
//    // Parse the API response and convert it to StockData array
//    // Here you should parse the JSON response and return StockData
//    return nil // Replace with actual parsing logic
//}
//
//
//
////Welcome to Alpha Vantage! Your dedicated access key is: MNKW0OL7W5DW15TJ. Please record this API key at a safe place for future data access.
