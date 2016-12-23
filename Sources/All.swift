//
//  All.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation
import Commandant
import PathKit
import Result

struct OpenAllCommand: CommandProtocol {
    typealias Options = OpenAllOptions
    
    var verb: String = "all"
    var function: String = "Opens the Xcode workspace or project. Tries to generate a project for Swift Package Manager manifests."
    
    func run(_ options: Options) -> Result<(), OpenError> {
        Path.current = options.path
        return openWork()
            .flatMapError({ previous -> Result<Process, OpenError> in
                openProject().mapError(OpenError.error(with: previous))
            })
            .flatMapError(options.generatesProject
                ? { openPackage().mapError(OpenError.error(with: $0)) }
                : Result.failure
            )
            .map({ _ in () })
    }
}

struct OpenAllOptions: OptionsProtocol {
    let generatesProject: Bool
    let path: Path
    
    static func create(generatesProject: Bool) -> (String) -> OpenAllOptions {
        return { path in
            OpenAllOptions(generatesProject: true, path: Path.current + path)
        }
    }
    
    static func evaluate(_ m: CommandMode) -> Result<OpenAllOptions, CommandantError<OpenError>> {
        return OpenAllOptions.create
            <*> m <| Option(key: "generate-xcodeproj", defaultValue: true, usage: "Indicates wether Xcode projects shall be generated from `Package.swift` files.")
            <*> m <| Argument<String>(defaultValue: ".", usage: "The path containing the project.")
    }
}
