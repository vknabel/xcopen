//
//  Error.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation

enum OpenError: Error {
    case fileNotFound(String)
    case couldNotGenerate
    case commandFailed(Process)
    indirect case alternative(OpenError, OpenError)
    
    var localizedDescription: String {
        switch self {
        case let .fileNotFound(name):
            return "File not found: \(name)."
        case .couldNotGenerate:
            return "Could not generate Xcode project."
        case let .commandFailed(process):
            let code = process.terminationStatus
            let command = (process.arguments ?? []).reduce(process.launchPath ?? "", { "\($0) \($1)" })
            return "Command failed with \(code): \(command)"
        case let .alternative(lhs, rhs):
            return "  \(lhs.localizedDescription)\n  \(rhs.localizedDescription)"
        }
    }
    
    static func error(with previous: OpenError) -> (_ next: OpenError) -> OpenError {
        return { next in
            .alternative(previous, next)
        }
    }
}
