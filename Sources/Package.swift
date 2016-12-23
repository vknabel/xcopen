//
//  Package.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation
import Commandant
import Result
import PathKit

struct OpenPackageCommand: CommandProtocol {
    typealias Options = PathOptions
    
    var verb: String = "pm"
    var function: String = "Generates a new project from Package.swift and opens it."
    
    func run(_ options: Options) -> Result<(), OpenError> {
        Path.current = options.path
        return openPackage().map({ _ in () })
    }
}
