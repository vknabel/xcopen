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

struct OpenProjectCommand: CommandProtocol {
    typealias Options = NoOptions<OpenError>
    
    var verb: String = "proj"
    var function: String = "Opens the Xcode project."
    
    func run(_ options: NoOptions<OpenError>) -> Result<(), OpenError> {
        return openProject().map({ _ in () })
    }
}
