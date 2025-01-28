//
//  BerlinClockFuncs.swift
//  berlinClock
//
//  Created by Алибек Мендешев on 24.01.2025.
//

import Foundation

private func parseTime(_ input: String) -> (hours: Int, minutes: Int, seconds: Int) {
    let components = input.split(separator: ":")
    return (
        Int(components[0]) ?? 0,
        Int(components[1]) ?? 0,
        Int(components[2]) ?? 0
    )
}

private func getSeconds(_ time: String) -> String {
    return parseTime(time).seconds % 2 == 0 ? "Y" : "O"
}

private func getMinutes(_ minutes: String) -> String {
    let minutes = parseTime(minutes).minutes
    var output = ""
    
    for i in 0..<minutes / 5 {
        if (i + 1) % 3 == 0 {
            output += "R"
        } else {
            output += "Y"
        }
    }
    for _ in minutes / 5..<11 {
        output += "O"
    }
    
    switch minutes % 5 {
    case 0:
        output += "OOOO"
    case 1:
        output += "YOOO"
    case 2:
        output += "YYOO"
    case 3:
        output += "YYYO"
    default:
        output += "YYYY"
    }
    
    return output
}

private func getHours(_ input: String) -> String {
    let hours = parseTime(input).hours
    var output = ""
    
    for _ in 0..<hours / 5 {
        output += "R"
    }
    for _ in hours / 5..<4 {
        output += "O"
    }
    
    switch hours % 5 {
    case 0:
        output += "OOOO"
    case 1:
        output += "ROOO"
    case 2:
        output += "RROO"
    case 3:
        output += "RRRO"
    default:
        output += "RRRR"
    }
    
    return output
}

func displayBerlinClock(time: String) -> String {
    
    return getSeconds(time) + getHours(time) + getMinutes(time)
}





