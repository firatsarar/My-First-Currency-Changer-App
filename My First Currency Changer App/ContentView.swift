//
//  ContentView.swift
//  My First Currency Changer App
//
//  Created by Fırat Sarar on 30.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: Double = 1.0
    @State private var usdRate: Double = 43.43
    @State private var eurRate: Double = 51.66
    @State private var cadRate: Double = 32.02
    @State private var yenRate: Double = 03.56
    @State private var rubRate: Double = 01.75
    @State private var tryRate: Double = 1.00
    
    enum currencies: String {
        case USD
        case EUR
        case TRY
    }
    
    func convert(from amount: Double, to rate: Double) -> Double {
        amount * rate
    }
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("USD")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        Text("🇺🇸")
                            .font(.largeTitle)
                        Spacer()
                        Text("\(convert(from: amount, to: usdRate), specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    HStack {
                        Text("EUR")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        Text("🇪🇺")
                            .font(.largeTitle)
                        Spacer()
                        Spacer()
                        Text("\(convert(from: amount, to: eurRate), specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    HStack {
                        Text("CAD")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        Text("🇨🇦")
                            .font(.largeTitle)
                        Spacer()
                        Spacer()
                        Text("\(convert(from: amount, to: cadRate), specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    HStack {
                        Text("YEN")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        Text("🇯🇵")
                            .font(.largeTitle)
                        Spacer()
                        Spacer()
                        Text("\(convert(from: amount, to: yenRate), specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    HStack {
                        Text("RUB")
                            .font(.largeTitle)
                            .bold()
                            .padding(.leading, 10)
                        Text("🇷🇺")
                            .font(.largeTitle)
                        Spacer()
                        Spacer()
                        Text("\(convert(from: amount, to: rubRate), specifier: "%.2f")")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                    }
                    
                }
            }
            HStack {
                TextField(
                    "Miktar",
                    value: $amount,
                    formatter: NumberFormatter()
                )
                .keyboardType(.decimalPad)
                .font(.largeTitle)
                .padding(.leading, 5)
                .bold()
                .frame(width: 240, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
                    
                )
                
                .padding(.leading, 5)
                
                Button {
                    
                } label: {
                    Text("Hesapla")
                        .font(.title3)
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
    }
}



#Preview {
    ContentView()
}
