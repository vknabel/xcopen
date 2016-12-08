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

struct OpenPackageCommand: CommandProtocol {
    typealias Options = NoOptions<OpenError>
    
    var verb: String = "pm"
    var function: String = "Generates a new project from Package.swift and opens it."
    
    func run(_ options: NoOptions<OpenError>) -> Result<(), OpenError> {
        return openPackage().map({ _ in () })
    }
}
