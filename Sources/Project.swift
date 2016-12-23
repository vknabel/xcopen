//
//  Project.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation
import Commandant
import Result
import PathKit

struct OpenProjectCommand: CommandProtocol {
    typealias Options = PathOptions
    
    var verb: String = "proj"
    var function: String = "Opens the Xcode project."
    
    func run(_ options: Options) -> Result<(), OpenError> {
        Path.current = options.path
        return openProject().map({ _ in () })
    }
}
