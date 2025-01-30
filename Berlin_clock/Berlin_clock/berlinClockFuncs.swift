enum Errors: Error {
    case wrongFormat

    var localizedDescription: String {
        switch self {
        case .wrongFormat:
            return "Input format is not correct. Please type in format below: HH:MM:SS"
        }
    }
}

private func parseTime(_ input: String) throws -> (hours: Int, minutes: Int, seconds: Int) {
    let components = input.split(separator: ":")
        
    guard components.count == 3,
          let hours = Int(components[0]),
          let minutes = Int(components[1]),
          let seconds = Int(components[2]) else {
        throw Errors.wrongFormat
    }
        
    return (hours, minutes, seconds)
}

private func getSeconds(_ time: String) throws -> String {
    return try parseTime(time).seconds % 2 == 0 ? "Y" : "O"
}

private func getMinutes(_ minutes: String) throws -> String {
    let minutes = try parseTime(minutes).minutes
    var output = ""
    
    for i in 0..<minutes / 5 {
        output += (i + 1) % 3 == 0 ? "R" : "Y"
    }
    output += String(repeating: "O", count: 11 - output.count)
    
    let remainder = minutes % 5
    output += String(repeating: "Y", count: remainder)
    output += String(repeating: "O", count: 4 - remainder)
    
    return output
}

private func getHours(_ input: String) throws -> String {
    let hours = try parseTime(input).hours
    var output = ""
    
    output += String(repeating: "R", count: hours / 5)
    output += String(repeating: "O", count: 4 - output.count)
    
    let remainder = hours % 5
    output += String(repeating: "R", count: remainder)
    output += String(repeating: "O", count: 4 - remainder)
    
    return output
}

func displayBerlinClock(time: String) -> String {
    do {
        let seconds = try getSeconds(time)
        let hours = try getHours(time)
        let minutes = try getMinutes(time)
        return seconds + "\n" + hours + "\n" + minutes
    } catch let error as Errors {
        return error.localizedDescription
    } catch {
        return "Unexpected error: \(error)"
    }
}
