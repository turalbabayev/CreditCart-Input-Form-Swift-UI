//
//  ContentView.swift
//  CreditCart Input Form
//
//  Created by Tural Babayev on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var card: CardModel = .init()
    var body: some View {
        VStack(spacing: 15){
            CustomTextField(value: $card.number , hint: "", title: "Card Number") {
                card.number = String(card.number.group(" ", count: 4).prefix(19))
            }
            
            CustomTextField(value: $card.name , hint: "", title: "Card Name") {
                
            }
            
            HStack(spacing: 10){
                //Limiting Month and year to max length of 2  and cvv 3
                CustomTextField(value: $card.month , hint: "", title: "Month") {
                    card.month = String(card.month.prefix(2))
                }
                
                CustomTextField(value: $card.year , hint: "", title: "Year") {
                    card.year = String(card.year.prefix(2))
                }
                
                CustomTextField(value: $card.cvv , hint: "", title: "CVV") {
                    card.cvv = String(card.cvv.prefix(3))
                }
            }
            .keyboardType(.numberPad)
            
            Spacer(minLength: 0)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}



