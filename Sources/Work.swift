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

struct OpenWorkCommand: CommandProtocol {
    typealias Options = NoOptions<OpenError>
    
    var verb: String = "work"
    var function: String = "Opens the Xcode workspace."
    
    func run(_ options: NoOptions<OpenError>) -> Result<(), OpenError> {
        return openWork().map({ _ in () })
    }
}
