import SwiftUI

struct ContentView: View {


    @State private var isSheetShowing = false
    @State private var amountText = "1"
    @State private var selectedCurrency = "USD"


    private let exchangeRates: [String: (rate: Decimal, emoji: String)] = [
        "USD": (1, "🇺🇸"),
        "EUR": (0.84, "🇪🇺"),
        "GBP": (0.73, "🇬🇧"),
        "AUD": (1.44, "🇦🇺"),
        "CAD": (1.36, "🇨🇦"),
        "TRY": (43.36, "🇹🇷"),
        "RUB": (76.37, "🇷🇺"),
        "INR": (91.69, "🇮🇳")
    ]

    private var sortedRates: [(key: String, value: (rate: Decimal, emoji: String))] {
        exchangeRates.sorted { $0.key < $1.key }
    }


    private var baseAmountInUSD: Decimal {
        let amount = Decimal(string: amountText) ?? 0
        let rate = exchangeRates[selectedCurrency]?.rate ?? 1
        return amount / rate
    }


    private let formatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .decimal
        f.maximumFractionDigits = 2
        return f
    }()

    private func formatted(_ value: Decimal) -> String {
        formatter.string(from: value as NSDecimalNumber) ?? ""
    }


    var body: some View {
        VStack {
            title
            currencyList
            inputBar
        }
        .sheet(isPresented: $isSheetShowing) {
            currencyPicker
        }
    }
}

private extension ContentView {

    var title: some View {
        Text("Currencies")
            .font(.largeTitle)
            .bold()
    }

    var currencyList: some View {
        ScrollView {
            VStack {
                ForEach(sortedRates, id: \.key) { currency, data in
                    HStack {
                        Text("\(data.emoji) \(currency)")
                            .font(.title)
                            .bold()
                        Spacer()
                        Text(formatted(baseAmountInUSD * data.rate))
                    }
                    .padding()
                    Divider()
                }
            }
        }
    }

    var inputBar: some View {
        HStack {
            TextField("✨", text: $amountText)
                .keyboardType(.decimalPad)
                .padding()
                .font(.largeTitle)
                .bold()
                .frame(width: 240, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, lineWidth: 1)
                )

            Button {
                isSheetShowing = true
            } label: {
                Text(selectedCurrency)
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                    .background(
                        RoundedRectangle(cornerRadius: 60)
                            .fill(Color.blue)
                    )
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }

    var currencyPicker: some View {
        NavigationView {
            List {
                ForEach(sortedRates, id: \.key) { currency, data in
                    Button {
                        selectedCurrency = currency
                        isSheetShowing = false
                    } label: {
                        HStack {
                            Text("\(data.emoji) \(currency)")
                                .bold()
                            Spacer()
                            if selectedCurrency == currency {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Choose Currency")
        }
    }
}

#Preview {
    ContentView()
}
