//
//  BugsCatcher.swift
//  berlinClock
//
//  Created by Алибек Мендешев on 25.01.2025.
//

import Foundation

enum Erros: Error {
    case wrongFormat
    
    var localizedDescription: String {
        switch self {
        case .wrongFormat:
            return "Input format is not correct. Please type in format below: HH:MM:SS"
        }
    }
}
