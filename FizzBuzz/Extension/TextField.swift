//
//  TextField.swift
//  FizzBuzz
//
//  Created by Antoine El Samra on 26/08/2023.
//

import UIKit

extension UITextField {
    
    enum isValidType {
        case number
        case word
    }

    func isValid(with word: isValidType) -> Bool {
        guard let text = self.text,
              !text.isEmpty else {
            print("Please fill the field.")
            return false
        }
        switch word {
        case .number:
            return NSPredicate(format: "SELF MATCHES %@", "[0-9]*").evaluate(with: text)
        case .word:
            return NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]+").evaluate(with: text)
        }
    }
}
