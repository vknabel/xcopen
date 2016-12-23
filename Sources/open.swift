//
//  open.swift
//  xcopen
//
//  Created by Valentin Knabel on 08.12.16.
//
//

import Foundation
import Result
import PathKit

fileprivate func run(_ args: String...) -> Result<Process, OpenError> {
    let process = Process()
    process.launchPath = "/usr/bin/env"
    process.arguments = args
    process.launch()
    process.waitUntilExit()
    
    if process.terminationStatus == 0 {
        return .success(process)
    } else {
        return .failure(.commandFailed(process))
    }
}

fileprivate func open(_ file: Path) -> Result<Process, OpenError> {
    return run("open", file.description)
}

fileprivate func open(glob: String) -> () -> Result<Process, OpenError> {
    return {
        if let file = Path.current.glob(glob).first {
            return open(file)
        } else {
            return .failure(.fileNotFound(glob))
        }
    }
}

let openWork = open(glob: "*.xcworkspace")
let openProject = open(glob: "*.xcodeproj")
let openCordovaWork = open(glob: "platforms/ios/*.xcworkspace")
let openCordovaProject = open(glob: "platforms/ios/*.xcodeproj")
func openPackage() -> Result<Process, OpenError> {
    let package = Path.current + "Package.swift"
    if package.exists {
        return run("swift", "package", "generate-xcodeproj")
            .flatMap({ _ in openProject() })
            .flatMap({ _ in openCordovaWork() })
            .flatMap({ _ in openCordovaProject() })
    } else {
        return .failure(.fileNotFound("Package.swift"))
    }
}
