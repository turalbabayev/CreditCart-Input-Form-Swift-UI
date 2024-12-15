//
//  Extensions.swift
//  CreditCart Input Form
//
//  Created by Tural Babayev on 14.12.2024.
//

import SwiftUI

extension String{
    func group(_ character: Character, count: Int) -> String{
        var modifiedString = self.replacingOccurrences(of: String(character), with: "")
        
        for index in 0..<modifiedString.count{
            if index % count == 0 && index != 0{
                let groupCharactersCount = modifiedString.filter { $0 == character }.count
                let stringIndex = modifiedString.index(modifiedString.startIndex , offsetBy: index + groupCharactersCount)
                modifiedString.insert(character, at: stringIndex)
            }
        }
        
        return modifiedString
    }
    
    func dummyText(_ character: Character, count: Int) -> String{
        var tempText = self.replacingOccurrences(of: String(character), with: "")
        let remaning = min(max(count - tempText.count , 0),count)
        
        if remaning > 0 {
            tempText.append(String(repeating: character, count: remaning))
        }
        
        return tempText
    }
}
