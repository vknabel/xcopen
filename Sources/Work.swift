//
//  Work.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation
import Commandant
import Result
import PathKit

struct OpenWorkCommand: CommandProtocol {
    typealias Options = PathOptions
    
    var verb: String = "work"
    var function: String = "Opens the Xcode workspace."
    
    func run(_ options: Options) -> Result<(), OpenError> {
        Path.current = options.path
        return openWork().map({ _ in () })
    }
}
