//
//  Extensions.swift
//  CreditCart Input Form
//
//  Created by Tural Babayev on 14.12.2024.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var value: String
    var hint: String
    var title: String
    var onChange: ()->()
    //View Properties
    @FocusState private var isActive: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.caption2)
                .foregroundStyle(.gray)
            
            TextField(hint, text: $value)
                .padding(.horizontal, 25)
                .padding(.vertical, 12)
                .contentShape(.rect)
                .background {
                    //Change Stroke Color when Active
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(isActive ? .blue : .gray.opacity(0.5), lineWidth: 1.5)
                    .animation(.snappy, value: isActive)

                }
                .focused($isActive)
        }
        .onChange(of: value) { oldValue, newValue in
            onChange()
        }
    }
}
