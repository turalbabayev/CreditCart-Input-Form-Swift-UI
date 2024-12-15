//
//  CardModel.swift
//  CreditCart Input Form
//
//  Created by Tural Babayev on 14.12.2024.
//

import Foundation

struct CardModel: Hashable{
    var name: String = ""
    var number: String = ""
    var cvv: String = ""
    var month: String = ""
    var year: String = ""
    var rawCardNumber: String{
        number.replacingOccurrences(of: " ", with: "")
    }
}

//Active TextField
enum ActiveField{
    case none
    case number
    case name
    case month
    case year
    case cvv
}
