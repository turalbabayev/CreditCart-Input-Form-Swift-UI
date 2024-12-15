//
//  ContentView.swift
//  CreditCart Input Form
//
//  Created by Tural Babayev on 14.12.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var card: CardModel = .init()
    @State private var animateField: ActiveField?
    @FocusState private var activeField: ActiveField?
    
    var body: some View {
        
        ZStack{
            if animateField == .cvv{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.red.mix(with: .blue, by: 0.2))
                    .overlay {
                        cardBackView()
                    }
                    .frame(height: 200)
                    .transition(.reverseFlip)
            } else{
                MeshGradient(
                    width: 3,
                    height: 3,
                    points: [
                        .init(0,0), .init(0.5,0),.init(1,0),
                        .init(0,0.5),.init(0.9,0.6),.init(1,0.5),
                        .init(0,1),.init(0.5,1),.init(1,1)
                    ],
                    colors: [
                        .red,.red,.pink,
                        .pink, .orange, .red,
                        .red,.orange,.red
                    ]
                )
                .clipShape(.rect(cornerRadius: 25))
                .overlay {
                    CardFrondView()
                }
                .transition(.flip)
            }
        }
        .frame(height: 200)
        
        
        VStack(spacing: 15){
            CustomTextField(value: $card.number , hint: "", title: "Card Number") {
                card.number = String(card.number.group(" ", count: 4).prefix(19))
            }
            .focused($activeField,equals: .number)
            
            CustomTextField(value: $card.name , hint: "", title: "Card Name") {
                
            }
            .focused($activeField,equals: .name)

            
            HStack(spacing: 10){
                //Limiting Month and year to max length of 2  and cvv 3
                CustomTextField(value: $card.month , hint: "", title: "Month") {
                    card.month = String(card.month.prefix(2))
                }
                .focused($activeField,equals: .month)
                
                CustomTextField(value: $card.year , hint: "", title: "Year") {
                    card.year = String(card.year.prefix(2))
                }
                .focused($activeField,equals: .year)

                
                CustomTextField(value: $card.cvv , hint: "", title: "CVV") {
                    card.cvv = String(card.cvv.prefix(3))
                }
                .focused($activeField,equals: .cvv)

            }
            .keyboardType(.numberPad)
            
            Spacer(minLength: 0)
        }
        .padding()
        .onChange(of: activeField) { oldValue, newValue in
            withAnimation(.snappy){
                animateField = newValue     
            }
        }
    }
    
    //Card Frond View
    @ViewBuilder
    func CardFrondView() -> some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 4) {
                Text("CARD NUMBER")
                    .font(.caption)
                
                Text(String(card.rawCardNumber.dummyText("*", count: 16).prefix(16)).group(" ", count: 4))
                    .font(.title2)
                    
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .frame(maxHeight: .infinity)
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("CARD HOLDER")
                        .font(.caption)
                    
                    Text(card.name.isEmpty ? "YOUR NAME" : card.name)
                        .font(.title2)
                        
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(10)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("EXPIRES")
                        .font(.caption)
                    
                    HStack(spacing: 4){
                        Text(String(card.month.prefix(2)).dummyText("M", count: 2))
                        Text("/")
                        Text(String(card.year.prefix(2)).dummyText("Y", count: 2))
                        
                    }
                    
                        
                }
                .padding(10)
            }
        }
        .foregroundStyle(.white)
        .monospaced()
        .contentTransition(.numericText())
        .animation(.snappy, value: card)
        .padding(15)
        
        
    }
    
    //Card Back View
    func cardBackView() -> some View {
        VStack(spacing: 15){
            Rectangle()
                .fill(.black)
                .frame(height: 45)
                .padding(.horizontal, -15)
                .padding(.top, 10)

            
            VStack(alignment: .trailing, spacing: 6) {
                Text("CVV")
                    .font(.caption)
                    .padding(.trailing, 10)

                
                RoundedRectangle(cornerRadius: 8)
                    .fill(.white)
                    .frame(height: 45)
                    .overlay(alignment: .trailing) {
                        Text(String(card.cvv.prefix(3)).dummyText("*", count: 3))
                            .foregroundStyle(.black)
                            .padding(.trailing, 15)
                    }
                
            }
            .foregroundStyle(.white)
            .monospaced()
            
            Spacer(minLength: 0)
        }
        .padding(15)
        .contentTransition(.numericText())
        .animation(.snappy, value: card)
        
    }
}

#Preview {
    ContentView()
}



