//
//  PathOptions.swift
//  xcopen
//
//  Created by Valentin Knabel on 23.12.16.
//
//

import Foundation
import Commandant
import PathKit
import Result

struct PathOptions: OptionsProtocol {
    let path: Path
    
    static func evaluate(_ m: CommandMode) -> Result<PathOptions, CommandantError<OpenError>> {
        return PathOptions.init
            <*> m <| Argument<String>(defaultValue: ".", usage: "The path containing the project.")
    }
}

extension PathOptions {
    init(path: String) {
        self.path = Path.current + path
    }
}
