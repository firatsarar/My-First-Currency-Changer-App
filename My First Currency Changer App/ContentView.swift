//
//  ContentView.swift
//  My First Currency Changer App
//
//  Created by Fırat Sarar on 30.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var isSheetShowing = false
    @State private var amount: Decimal = 1.0
    
    @State private var baseAmountInUSD: Double = 1.00
    @State private var selectedCurrency: String = "USD"
    
    let exchangeRates: [String: Double] = [
        "USD": 1.00,
        "EUR": 0.84,
        "GBP": 0.73,
        "AUD": 1.44,
        "CAD": 1.36,
        "TRY": 43.36,
        "RUB": 76.37,
        "INR": 91.69,
        
    ]
    
    var body: some View {
        VStack {
            Text("Currencies")
                .bold()
                .font(.largeTitle)
            ScrollView {
                VStack {
                    ForEach(exchangeRates.sorted(by: { $0.key < $1.key }), id: \.key) { currency, rate in
                        HStack {
                            Text(currency).bold()
                            Spacer()
                            Text(String(format: "%.2f", baseAmountInUSD * rate))
                        }
                        .padding()
                    }
                }
            }
            HStack {
                    TextField(
                        "✨",
                        value: Binding(
                            get: {
                                baseAmountInUSD * (exchangeRates[selectedCurrency] ?? 1.0)
                            },
                            set: {
                                newValue in
                                let rate = exchangeRates[selectedCurrency] ?? 1.0
                                baseAmountInUSD = newValue / rate
                            }
                        ),
                        formatter: NumberFormatter()
                    )
                    .keyboardType(.decimalPad)
                    .font(.largeTitle)
                    .opacity(1)
                    .padding(.leading, 15)
                    .bold()
                    .frame(width: 240, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                        
                    )
                .padding(.leading, 5)
                
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
                                .fill(Color.blue))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.trailing, 4)
            }
            
        }
        .sheet(isPresented: $isSheetShowing) {
            NavigationView {
                List {
                    ForEach(exchangeRates.keys.sorted(), id: \.self) { currencyName in
                        Button {
                            selectedCurrency = currencyName
                            isSheetShowing = false
                        } label: {
                            HStack {
                                Text(currencyName)
                                    .bold()
                                    .font(.headline)
                                Spacer()
                                if selectedCurrency == currencyName {
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
        }




#Preview {
    ContentView()
}
